# frozen_string_literal: true

module Types
  module NodeType
    include Types::BaseInterface
    description 'An object with an ID.'
    # Add the `id` field
    include GraphQL::Types::Relay::NodeBehaviors
  end
end
