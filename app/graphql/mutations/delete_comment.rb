# frozen_string_literal: true

module Mutations
  class DeleteComment < BaseMutation
    type String

    argument :id, ID, required: true
    def resolve(id:)
      Comment.find(id).delete
      Notification.find_by(comment_id: id, action: 'comment').destroy!
      'DELETE COMPLETE'
    end
  end
end
