# frozen_string_literal: true

module Types
  class ClipType < Types::BaseObject
    field :id, ID, null: false
    field :movie_id, ID, null: true
    field :user_id, ID, null: true
    field :movie, Types::MovieType, null: true
    field :user, Types::UserType, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end

  def movie
    Loaders::AssociationLoader.for(Clip, :movie).load(object)
  end
end
