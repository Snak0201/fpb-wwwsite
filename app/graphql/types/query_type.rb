# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    description 'queries'

    field :articles, resolver: Resolvers::ArticlesResolver, description: 'all published articles'
    field :bureau, resolver: Resolvers::BureauResolver, description: 'single bureau with slug'
    field :bureaus, resolver: Resolvers::BureausResolver, description: 'all bureaus'
    field :committees, resolver: Resolvers::CommitteesResolver, description: 'all committees'
  end
end
