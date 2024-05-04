# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    description 'queries'

    field :bureau, resolver: Resolvers::BureauResolver, description: 'get single bureau with slug'
    field :bureaus, resolver: Resolvers::BureausResolver, description: 'get all bureaus'
  end
end
