# frozen_string_literal: true

module Types
  class ModifierType < Types::BaseObject
    description 'A modifier'

    field :default_quantity, Integer, null: false, description: 'Display quantity of the modifier'
    field :display_order, Integer, null: false, description: 'Display order of the modifier'
    field :id, ID, null: false, description: 'ID of the modifier'
    field :item, Types::ItemType, null: false, description: 'Item of the modifier'
    field :item_id, Integer, null: false, description: 'ID of the item'
    field :modifier_group_id, Integer, null: false, description: 'ID of the modifier group'
    field :price_override, Float, null: false, description: 'Price override of the modifier'
  end
end
