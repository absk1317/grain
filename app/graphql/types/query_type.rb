# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    description 'The query root of this schema. See available queries.'

    field :node, Types::NodeType, null: true, description: 'Fetches an object given its ID.' do
      argument :id, ID, required: true, description: 'ID of the object.'
    end

    field :menu, Types::MenuType, { null: false, description: 'Fetches a menu.' } do
      argument :id, ID, required: true, description: 'ID of the menu.'
    end
    field :menus, [Types::MenuType], { null: false, description: 'Fetches a list of menus.' }

    field :item, Types::ItemType, { null: false, description: 'Fetches an item.' } do
      argument :id, ID, required: true, description: 'ID of the item.'
    end
    field :items, [Types::ItemType], { null: false, description: 'Fetches a list of items.' }

    field :section, Types::SectionType, { null: false, description: 'Fetches a section.' } do
      argument :id, ID, required: true, description: 'ID of the section.'
    end
    field :sections, [Types::SectionType], { null: false, description: 'Fetches a list of sections.' }

    field :nodes, [Types::NodeType, { null: true }],
          null: true,
          description: 'Fetches a list of objects given a list of IDs.' do
      argument :ids, [ID], required: true, description: 'IDs of the objects.'
    end

    def node(id:)=context.schema.object_from_id(id, context)
    def nodes(ids:) = ids.map { |id| context.schema.object_from_id(id, context) }

    def menus = Menu.all
    def menu(id:) = Menu.fetch(id)

    def items = Item.all
    def item(id:) = Item.fetch(id)

    def sections = Section.all
    def section(id:) = Section.fetch(id)
  end
end
