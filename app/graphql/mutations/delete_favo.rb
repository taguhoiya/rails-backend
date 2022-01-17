# frozen_string_literal: true

module Mutations
  class DeleteFavo < BaseMutation
    type String

    argument :mark_id, ID, required: true
    argument :user_id, ID, required: true
    def resolve(**args)
      Favorite.where(user_id: args[:user_id]).find_by(mark_id: args[:mark_id]).delete
      'DELETE COMPLETE'
    end
  end
end
