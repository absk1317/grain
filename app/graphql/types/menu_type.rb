# frozen_string_literal: true

module Types
  class MenuType < Types::BaseObject
    description 'A menu'

    field :id, ID, null: false, description: 'ID of the menu'
    field :identifier, String, null: false, description: 'Identifier of the menu'
    field :label, String, null: false, description: 'Label of the menu'
    field :sections, [Types::SectionType], null: false, description: 'Sections of the menu'
    field :state, String, null: false, description: 'State of the menu'
  end
end
