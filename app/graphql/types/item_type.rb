# frozen_string_literal: true

module Types
  class ItemType < Types::BaseObject
    description 'An item'

    field :description, String, null: false, description: 'Description of the item'
    field :id, ID, null: false, description: 'ID of the item'
    field :identifier, String, null: false, description: 'Identifier of the item'
    field :item_type, String, null: false, description: 'Type of the item'
    field :label, String, null: false, description: 'Label of the item'
    field :modifier_groups, [Types::ModifierGroupType], null: false, description: 'Modifier groups of the item'
    field :price, Float, null: false, description: 'Price of the item'
  end
end
