module Resolvers
  class BureauResolver < Resolvers::BaseResolver
    description 'get bureau on slug'

    type Types::BureauType, null: false

    argument :slug, String, required: true

    def resolve(slug:)
      Bureau.find_by(slug:)
    end
  end
end
