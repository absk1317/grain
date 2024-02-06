# frozen_string_literal: true

module Types
  class ModifierType < Types::BaseObject
    description 'A modifier'

    # rubocop:disable GraphQL/ExtractType
    field :display_order, Integer, null: false, description: 'Display order of the modifier'
    field :display_quantity, Integer, null: false, description: 'Display quantity of the modifier'
    # rubocop:enable GraphQL/ExtractType

    field :id, ID, null: false, description: 'ID of the modifier'
    field :item_id, Integer, null: false, description: 'ID of the item'
    field :modifier_group_id, Integer, null: false, description: 'ID of the modifier group'
    field :price_override, Float, null: false, description: 'Price override of the modifier'
  end
end
