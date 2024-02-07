# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MenusQuery', type: :graphql do
  describe 'menus' do
    let(:menus_list_query) do
      <<~GQL
        query {
          menus {
            id
            label
            identifier
            startDate
          }
        }
      GQL
    end

    let(:menu_show_query) do
      <<~GQL
        query {
          menu(id: menu_id) {
            id
            label
            identifier
            startDate
            state
          }
        }
      GQL
    end

    it 'returns all menus' do
      _menus = create_list(:menu, 2)
      result = execute_graphql(menus_list_query)
      menus = result.dig('data', 'menus')

      expect(menus.count).to eq(2)
    end

    it 'returns a single menu' do
      menu = create(:menu)
      result = execute_graphql(menu_show_query.sub('menu_id', menu.id.to_s))
      menu_result = result.dig('data', 'menu')
      expect(menu_result['id']).to eq(menu.id.to_s)
    end
  end
end
