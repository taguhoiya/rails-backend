# frozen_string_literal: true

module Resolvers
  class MovieCategoriesResolver < Resolvers::BaseResolver
    type [Types::MovieType], null: false
    def resolve
      Movie.select(:category).distinct.order(:category)
    end
  end
end
