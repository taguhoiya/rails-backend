# frozen_string_literal: true

module Resolvers
  class MovieCategoryResolver < Resolvers::BaseResolver
    type Types::MovieCategoryType, null: false
    argument :movie_id, ID, required: true
    def resolve(movie_id:)
      MovieCategory.find_by(movie_id: movie_id)
    end
  end
end
