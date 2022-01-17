# frozen_string_literal: true

module Types
  class MarkDraftType < Types::BaseObject
    field :id, ID, null: false
    field :num, Integer, null: false
    field :score, Float, null: false
    field :content, String, null: true
    field :movies, [Types::MovieType], null: false
    field :users, [Types::UserType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    def movies
      Loaders::AssociationLoader.for(User, :moives).load(object)
    end

    def users
      Loaders::AssociationLoader.for(User, :users).load(object)
    end
  end
end
