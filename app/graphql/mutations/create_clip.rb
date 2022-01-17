# frozen_string_literal: true

module Mutations
  class CreateClip < BaseMutation
    field :clip, Types::ClipType, null: true
    field :user, Types::UserType, null: true
    field :movie, Types::MovieType, null: true

    argument :movie_id, ID, required: true
    argument :user_id, ID, required: true
    def resolve(**args)
      movie = Movie.find(args[:movie_id])
      user = User.find(args[:user_id])
      clip = movie.clips.build(movie_id: args[:movie_id], user_id: args[:user_id])
      clip.save!
      clip_h = clip.attributes
      {
        clip: clip_h,
        movie: movie,
        user: user
      }
    end
  end
end
