# frozen_string_literal: true

module Types
  class FavoriteType < Types::BaseObject
    field :id, ID, null: false
    field :user, Types::UserType, null: false
    field :mark, Types::MarkType, null: false
    field :user_id, Integer, null: false
    field :mark_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    def user
      Loaders::AssociationLoader.for(Favorite, :user).load(object)
    end

    def mark
      Loaders::AssociationLoader.for(Favorite, :mark).load(object)
    end
  end
end
