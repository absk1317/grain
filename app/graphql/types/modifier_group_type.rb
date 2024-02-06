# frozen_string_literal: true

module Types
  class ModifierGroupType < Types::BaseObject
    description 'A modifier group'
    field :id, ID, null: false, description: 'ID of the modifier group'
    field :identifier, String, null: false, description: 'Identifier of the modifier group'
    field :label, String, null: false, description: 'Label of the modifier group'
    field :max_selections, Integer, null: false, description: 'Maximum number of selections'
    field :min_selections, Integer, null: false, description: 'Minimum number of selections'
  end
end
