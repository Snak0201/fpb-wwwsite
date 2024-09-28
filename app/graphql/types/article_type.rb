# frozen_string_literal: true

module Types
  class ArticleType < Types::BaseObject
    description 'published article on Hoshinonaka Government'

    field :bureaus, [Types::BureauType], null: true, description: 'jurisdiction bureaus'
    field :committees, [Types::CommitteeType], null: true, description: 'jurisdiction committees'
    field :content, String, description: 'markdown content'
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false, description: 'created at'
    field :id, ID, null: false, description: 'id'
    field :number, Integer, null: false, description: 'category number'
    field :published_at, GraphQL::Types::ISO8601DateTime, description: 'published at'
    field :title, String, null: false, description: 'title'
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false, description: 'updated at'

    # NOTE: ArticleTypeから局や委員会を直接呼び出せるようにする
    delegate :bureaus, to: :object
    delegate :committees, to: :object
  end
end
