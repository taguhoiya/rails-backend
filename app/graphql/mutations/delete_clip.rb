# frozen_string_literal: true

module Mutations
  class DeleteClip < BaseMutation
    type String

    argument :movie_id, ID, required: true
    argument :user_id, ID, required: true
    def resolve(**args)
      Clip.where(user_id: args[:user_id]).find_by(movie_id: args[:movie_id]).delete
      'DELETE COMPLETE'
    end
  end
end
