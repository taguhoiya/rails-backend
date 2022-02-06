# frozen_string_literal: true

module Mutations
  class DeleteFollow < BaseMutation
    field :follower, Types::UserType, null: true
    field :followed, Types::UserType, null: true

    argument :follower_id, ID, required: true
    argument :followed_id, ID, required: true
    def resolve(**args)
      followed = User.find(args[:followed_id])
      follower = User.find(args[:follower_id])
      follower.unfollow(args[:followed_id])
      noti = Notification.find_by(visited_id: follower.id, visitor_id: followed.id, action: 'follow')
      noti.destroy!
      {
        follower: follower,
        followed: followed
      }
    end
  end
end
