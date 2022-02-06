# frozen_string_literal: true

module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :content, String, null: false
    field :user, Types::UserType, null: false
    field :mark, Types::MarkType, null: false
    field :notifications, [Types::NotificationType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    def user
      Loaders::AssociationLoader.for(Comment, :user).load(object)
    end

    def mark
      Loaders::AssociationLoader.for(Comment, :mark).load(object)
    end
  end
end
