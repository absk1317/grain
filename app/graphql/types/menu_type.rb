# frozen_string_literal: true

module Types
  class MenuType < Types::BaseObject
    description 'A menu'

    field :end_date, GraphQL::Types::ISO8601Date, null: false, description: 'End date of the menu'
    field :id, ID, null: false, description: 'ID of the menu'
    field :identifier, String, null: false, description: 'Identifier of the menu'
    field :items, [Types::ItemType], null: false, description: 'Items of the menu'
    field :label, String, null: false, description: 'Label of the menu'
    field :sections, [Types::SectionType], null: false, description: 'Sections of the menu'
    field :start_date, GraphQL::Types::ISO8601Date, null: false, description: 'Start date of the menu'
    field :state, String, null: false, description: 'State of the menu'
  end
end
