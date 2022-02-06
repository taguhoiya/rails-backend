# frozen_string_literal: true

module Types
  class MarkType < Types::BaseObject
    field :id, ID, null: false
    field :score, Float, null: true
    field :content, String, null: false
    field :movie, Types::MovieType, null: true
    field :user, Types::UserType, null: true
    field :movie_id, ID, null: true
    field :user_id, ID, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :comments, [Types::CommentType], null: false
    field :favorites, [Types::FavoriteType], null: false
    field :notifications, [Types::NotificationType], null: false
    def movie
      Loaders::AssociationLoader.for(Mark, :movie).load(object)
    end

    def comments
      Loaders::AssociationLoader.for(Mark, :comments).load(object)
    end

    def favorites
      Loaders::AssociationLoader.for(Mark, :favorites).load(object)
    end

    def user
      Loaders::AssociationLoader.for(Mark, :user).load(object)
    end

    def notifications
      Loaders::AssociationLoader.for(Mark, :notifications).load(object)
    end
  end
end
