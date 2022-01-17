# frozen_string_literal: true

module Mutations
  class CreateMark < BaseMutation
    field :mark, Types::MarkType, null: true
    field :user, Types::UserType, null: true
    field :movie, Types::MovieType, null: true

    argument :score, Float, required: true
    argument :content, String, required: false
    argument :movie_id, ID, required: true
    argument :user_id, ID, required: true
    def resolve(**args)
      movie = Movie.find(args[:movie_id])
      user = User.find(args[:user_id])
      mark = movie.marks.build(score: args[:score], content: args[:content], user_id: args[:user_id])
      mark.save!
      mark_h = mark.attributes
      {
        mark: mark_h,
        movie: movie,
        user: user
      }
    end
  end
end
