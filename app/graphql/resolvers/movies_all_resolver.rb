# frozen_string_literal: true

module Resolvers
  class MoviesAllResolver < Resolvers::BaseResolver
    type Types::MovieType.connection_type, null: false
    def resolve
      Movie.all
    end
  end
end
