module Resolvers
  class BureausResolver < Resolvers::BaseResolver
    description 'get all bureaus'

    type [Types::BureauType], null: false

    def resolve
      Bureau.all
    end
  end
end
