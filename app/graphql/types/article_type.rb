# frozen_string_literal: true

module Types
  class ArticleType < Types::BaseObject
    field :id, ID, null: false, description: 'id'
    field :title, String, null: false, description: 'title'
    field :content, String, description: 'markdown content'
    field :number, Integer, null: false, description: 'category number'
    field :bureaus, [Types::BureauType], null: true, description: 'jurisdiction bureau'
    field :published_at, GraphQL::Types::ISO8601DateTime, description: 'published at'
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false, description: 'created at'
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false, description: 'updated at'
  
    def bureaus
      object.bureaus
    end
  end
end
