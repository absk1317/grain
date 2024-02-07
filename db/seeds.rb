# frozen_string_literal: true

# Create two menus
2.times do |i|
  menu = FactoryBot.create(:menu, label: "Menu ##{i + 1}")

  # Create sections for each menu
  3.times do |j|
    section = FactoryBot.create(:section, label: "Section ##{j + 1}")
    menu.menu_sections.create(section:, display_order: j + 1)

    # Create items for each section
    5.times do |k|
      item = FactoryBot.create(:item, :product, label: "Product Item ##{k + 1}")

      # Associate section with item
      FactoryBot.create(:section_item, section:, item:, display_order: k + 1)

      # Create modifier groups and modifiers for each item
      modifier_group = FactoryBot.create(:modifier_group, label: "Modifier Group for Item ##{k + 1}")

      # Associate item with modifier group
      FactoryBot.create(:item_modifier_group, item:, modifier_group:)

      # Create modifiers for the modifier group
      3.times do |m|
        FactoryBot.create(:modifier, modifier_group:, display_order: m + 1, price_override: Faker::Number.decimal(l_digits: 2), item:)
      end
    end
  end
end

Rails.logger.debug 'Seed data created successfully!'
