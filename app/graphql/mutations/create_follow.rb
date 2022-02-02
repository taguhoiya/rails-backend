# frozen_string_literal: true

module Mutations
  class CreateFollow < BaseMutation
    field :follower, Types::UserType, null: true
    field :followed, Types::UserType, null: true

    argument :follower_id, ID, required: true
    argument :followed_id, ID, required: true
    def resolve(**args)
      followed = User.find(args[:followed_id])
      follower = User.find(args[:follower_id])
      follower.follow(args[:followed_id])
      {
        follower: follower,
        followed: followed
      }
    end
  end
end
