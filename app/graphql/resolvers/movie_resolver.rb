# frozen_string_literal: true

module Resolvers
  class MovieResolver < Resolvers::BaseResolver
    type Types::MovieType, null: false
    argument :id, ID, required: true
    def resolve(id:)
      Movie.find(id)
    end
  end
end
