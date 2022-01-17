# frozen_string_literal: true

module Resolvers
  class MoviesResolver < Resolvers::BaseResolver
    type [Types::MovieType], null: false
    argument :id, [ID], required: true
    def resolve(id:)
      Movie.where(id: id)
    end
  end
end
