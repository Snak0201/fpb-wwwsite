module Resolvers
  class CommitteesResolver < Resolvers::BaseResolver
    description 'all committees list'

    type [Types::CommitteeType], null: true

    def resolve
      Committee.sorted
    end
  end
end
