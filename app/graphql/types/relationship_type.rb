# frozen_string_literal: true

module Types
  class RelationshipType < Types::BaseObject
    field :id, ID, null: false
    field :follower, [Types::UserType], null: true
    field :followed, [Types::UserType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :following_user, [Types::UserType], null: true
    field :follower_user, [Types::UserType], null: true
    def follower
      Loaders::AssociationLoader.for(User, :follower).load(object)
    end

    def followed
      Loaders::AssociationLoader.for(User, :followed).load(object)
    end

    def following_user
      Loaders::AssociationLoader.for(User, :following_user).load(object)
    end

    def follower_user
      Loaders::AssociationLoader.for(User, :follower_user).load(object)
    end
  end
end
