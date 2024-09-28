module Resolvers
  class CommitteeResolver < Resolvers::BaseResolver
    description 'committee detail'

    type Types::CommitteeType, null: true
    argument :slug, String, required: true, description: 'slug'

    def resolve(slug:)
      Committee.find_by(slug:)
    end
  end
end
