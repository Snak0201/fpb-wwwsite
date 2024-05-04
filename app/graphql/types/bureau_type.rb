# frozen_string_literal: true

module Types
  class BureauType < Types::BaseObject
    description 'bureau model'

    field :content, String, description: 'markdown content'
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false, description: 'time of created'
    field :description, String, null: false, description: 'short description text'
    field :id, ID, null: false, description: 'bigint id'
    field :name, String, null: false, description: 'name'
    field :slug, String, null: false, description: 'url slug'
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false, description: 'time of updated'
  end
end
