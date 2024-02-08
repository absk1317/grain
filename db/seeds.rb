# frozen_string_literal: true

# - Create a menu structure consisting of:
#   - **6 Sections**: Each embodying a unique category of offerings.
#   - **10 Products per section**: Resulting in a total of 60 top-level Products.
#         - **ModifierGroup**: For each section, assign 2 Modifier groups to half of the products (5 products), with each Modifier group containing 3 Modifiers linked to Components.
#     - The end structure should comprise 60 Product’s, 60 ModifierGroup’s, 180 Modifier’s, and 180 Component’s

sections = %w[Italian Snacks Desserts Drinks Seafood Grill]

products = {
  Italian: %w[Pasta Pizza Risotto Lasagna Spaghetti Carbonara Fettuccine Gnocchi Ravioli Tortellini],
  Snacks: %w[Chips Popcorn Pretzels Crackers Nuts Cookies Brownies Donuts Muffins Cupcakes],
  Desserts: ['Cheesecake', 'Ice Cream', 'Pudding', 'Tiramisu', 'Mousse', 'Parfait', 'Souffle', 'Trifle', 'Flan', 'Gelato'],
  Drinks: %w[Soda Juice Water Tea Coffee Beer Wine Liquor Smoothie Milkshake],
  Seafood: %w[Salmon Tuna Shrimp Crab Lobster Oyster Clam Mussel Squid Octopus],
  Grill: ['Burger', 'Hot Dog', 'Steak', 'Ribs', 'Chicken Wings', 'Sausage', 'Kebab', 'Skewer', 'Bratwurst', 'Meatball']
}.with_indifferent_access

menu = FactoryBot.create(:menu, label: 'Grain')
# **6 Sections**: Each embodying a unique category of offerings.
6.times do |j|
  section = FactoryBot.create(:section, label: sections[j])
  menu.menu_sections.create(section:, display_order: j + 1)

  # **10 Products per section**: Resulting in a total of 60 top-level Products.
  1.upto(5) do |k|
    item = FactoryBot.create(:item, :product, label: products[sections[j]][k - 1], price: Faker::Number.decimal(l_digits: 2))

    # Associate section with item
    FactoryBot.create(:section_item, section:, item:, display_order: k + 1)

    # assign 2 Modifier groups to product, with each Modifier group containing 3 Modifiers linked to Components.
    2.times do |_m|
      modifier_group = FactoryBot.create(:modifier_group, label: "Modifier Group for #{item.label} #{item.id}")
      ItemModifierGroup.create(item:, modifier_group:)

      # Create modifiers for the modifier group
      3.times do |n|
        component_item = FactoryBot.create(:item, :component, label: "Component Item ##{n + 1}")
        FactoryBot.create(:modifier, modifier_group:, display_order: n + 1, price_override: Faker::Number.decimal(l_digits: 2), item: component_item)
      end
    end
  end

  6.upto(10) do |k|
    item = FactoryBot.create(:item, :product, label: products[sections[j]][k - 1], price: Faker::Number.decimal(l_digits: 2))
    FactoryBot.create(:section_item, section:, item:, display_order: k + 1)
  end
end

# rubocop:disable Rails/Output

puts 'Seed data created successfully!'

puts '---------------------------------------------------'
puts "Products: #{Item.products.count}"
puts "ModifierGroups: #{ModifierGroup.count}"
puts "Modifiers: #{Modifier.count}"
puts "Components: #{Item.components.count}"
puts '---------------------------------------------------'

# rubocop:enable Rails/Output
