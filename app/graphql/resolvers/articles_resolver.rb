module Resolvers
  class ArticlesResolver < Resolvers::BaseResolver
    description 'get all articles'

    type Types::ArticleType.connection_type, null: true do
      description "article connection"
    end

    def resolve
      Article.published
    end
  end
end
