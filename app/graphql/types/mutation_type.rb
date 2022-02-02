# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :delete_follow, mutation: Mutations::DeleteFollow
    field :create_follow, mutation: Mutations::CreateFollow
    field :delete_mark, mutation: Mutations::DeleteMark
    field :delete_comment, mutation: Mutations::DeleteComment
    field :create_comment, mutation: Mutations::CreateComment
    field :delete_clip, mutation: Mutations::DeleteClip
    field :delete_favo, mutation: Mutations::DeleteFavo
    field :create_favo, mutation: Mutations::CreateFavo
    field :create_clip, mutation: Mutations::CreateClip
    field :update_user_image, mutation: Mutations::UpdateUserImage
    field :create_mark, mutation: Mutations::CreateMark
    field :update_mark, mutation: Mutations::UpdateMark
  end
end
