# frozen_string_literal: true

module Types
  class ArticleType < Types::BaseObject
    description 'published article on Hoshinonaka Government'

    field :bureaus, [Types::BureauType], null: true, description: 'jurisdiction bureau'
    field :content, String, description: 'markdown content'
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false, description: 'created at'
    field :id, ID, null: false, description: 'id'
    field :number, Integer, null: false, description: 'category number'
    field :published_at, GraphQL::Types::ISO8601DateTime, description: 'published at'
    field :title, String, null: false, description: 'title'
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false, description: 'updated at'

    delegate :bureaus, to: :object
  end
end
