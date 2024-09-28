# frozen_string_literal: true

module Types
  class CommitteeType < Types::BaseObject
    description 'article tags'

    field :articles, [Types::ArticleType], description: 'committee articles list'
    field :bureau_id, Integer, description: 'jurisdiction bureau id'
    field :content, String, description: 'markdown content'
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false, description: 'created_at'
    field :description, String, null: false, description: 'short description'
    field :id, ID, null: false, description: 'id'
    field :name, String, null: false, description: 'name'
    field :slug, String, null: false, description: 'search keyword'
    field :special, Boolean, null: false, description: 'is special committee'
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false, description: 'updated_at'
  end
end
