# frozen_string_literal: true

module Mutations
  class CreateComment < BaseMutation
    field :comment, Types::CommentType, null: true
    field :user, Types::UserType, null: true
    field :mark, Types::MarkType, null: true

    argument :content, String, required: true
    argument :mark_id, ID, required: true
    argument :user_id, ID, required: true

    def resolve(**args)
      raise StandardError if args[:content].empty?

      mark = Mark.find(args[:mark_id])
      user = User.find(args[:user_id])
      comment = mark.comments.build(mark_id: args[:mark_id], user_id: args[:user_id], content: args[:content])
      comment.save!
      comme_h = comment.attributes
      mark.create_notification_comment!(user, comment.id)
      {
        comment: comme_h,
        mark: mark,
        user: user
      }
    end
  end
end
