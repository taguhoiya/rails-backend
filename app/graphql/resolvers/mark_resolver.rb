# frozen_string_literal: true

module Resolvers
  class MarkResolver < Resolvers::BaseResolver
    type Types::MarkType, null: false
    argument :id, ID, required: true
    def resolve(id:)
      Mark.find(id)
      # mark_h[:movie] = Movie.find(mark.movie_id).attributes
      # mark_h[:user] = User.find(mark.user_id).attributes
      # {
      #   mark: mark_h
      # }
    end
  end
end
