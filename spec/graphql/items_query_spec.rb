# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ItemsQuery', type: :graphql do
  describe 'items' do
    let(:items_list_query) do
      <<~GQL
        query {
          items {
            description
            id
            identifier
            itemType
            label
            price
          }
        }
      GQL
    end

    let(:item_show_query) do
      <<~GQL
        query {
          item(id: item_id) {
            description
            id
            identifier
            itemType
            label
            price
          }
        }
      GQL
    end

    it 'returns all items' do
      _items = create_list(:item, 3)
      result = execute_graphql(items_list_query)
      items = result.dig('data', 'items')

      expect(items.count).to eq(3)
    end

    it 'returns a single item' do
      item = create(:item)
      result = execute_graphql(item_show_query.sub('item_id', item.id.to_s))
      item_result = result.dig('data', 'item')

      expect(item_result['id']).to eq(item.id.to_s)
    end
  end
end
