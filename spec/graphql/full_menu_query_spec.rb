# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'FullMenuQuery', type: :graphql do
  describe 'fullMenu' do
    let(:query) do
      <<~GQL
        query {
          menu(id: menu_id) {
            id
            startDate
            identifier
            sections {
              label
              description
              items {
                id
                modifierGroups {
                  id
                  label
                  minSelections
                  maxSelections
                  modifiers {
                    id
                    displayOrder
                    displayQuantity
                  }
                }
              }
            }
          }
        }
      GQL
    end

    it 'returns requested menu' do
      menu = load_seed_data

      result = execute_graphql(query.sub('menu_id', menu.id.to_s)).dig('data', 'menu')
      expect(result['id']).to eq(menu.id.to_s)
    end

    def load_seed_data
      menu = create(:menu)
      3.times { |i| create_section(menu, i) } # Create sections
      menu
    end

    def create_section(menu, idx)
      section = create(:section, label: "Section ##{idx + 1}")
      menu.menu_sections.create(section:, display_order: idx + 1)

      5.times { |k| create_item(section, k) } # Create items for each section
    end

    def create_item(section, idx)
      item = create(:item, label: "Item ##{idx + 1}")

      # Associate section with item
      create(:section_item, section:, item:, display_order: idx + 1)

      # Create modifier groups and modifiers for each item
      modifier_group = create(:modifier_group, label: "Modifier Group for Item ##{idx + 1}")

      # Associate item with modifier group
      create(:item_modifier_group, item:, modifier_group:)

      # Create modifier for the modifier group
      3.times do |m|
        create(:modifier, modifier_group:, display_order: m + 1, price_override: Faker::Number.decimal(l_digits: 2), item:)
      end
    end
  end
end
