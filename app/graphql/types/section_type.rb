# frozen_string_literal: true

module Types
  class SectionType < Types::BaseObject
    description 'A section'
    field :description, String, null: false, description: 'Description of the section'
    field :id, ID, null: false, description: 'ID of the section'
    field :identifier, String, null: false, description: 'Identifier of the section'
    field :items, [Types::ItemType], null: false, description: 'Items of the section'
    field :label, String, null: false, description: 'Label of the section'
  end
end
