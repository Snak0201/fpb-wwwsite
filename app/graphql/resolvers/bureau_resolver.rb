module Resolvers
  class BureauResolver < Resolvers::BaseResolver
    description 'get single bureau with slug'

    type Types::BureauType, null: true

    argument :slug, String, required: true, description: 'slug string of bureau'

    def resolve(slug:)
      Bureau.find_by(slug:)
    end
  end
end
