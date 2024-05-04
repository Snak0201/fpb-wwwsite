# frozen_string_literal: true

module Types
  module NodeType
    include Types::BaseInterface
    include GraphQL::Types::Relay::NodeBehaviors

    description 'nodes'
  end
end
