# frozen_string_literal: true

module Mutations
  class DeleteFavo < BaseMutation
    type String

    argument :mark_id, ID, required: true
    argument :user_id, ID, required: true
    def resolve(**args)
      Favorite.find_by(user_id: args[:user_id], mark_id: args[:mark_id]).delete
      noti = Notification.find_by(visited_id: args[:user_id], mark_id: args[:mark_id], action: 'favo')
      noti.destroy!
      'DELETE COMPLETE'
    end
  end
end
