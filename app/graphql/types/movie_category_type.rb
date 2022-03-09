# frozen_string_literal: true

module Types
  class MovieCategoryType < Types::BaseObject
    field :id, ID, null: false
    field :movie_id, ID, null: false
    field :action, Boolean, null: false
    field :adventure, Boolean, null: false
    field :animation, Boolean, null: false
    field :comedy, Boolean, null: false
    field :crime, Boolean, null: false
    field :documentary, Boolean, null: false
    field :drama, Boolean, null: false
    field :family, Boolean, null: false
    field :fantasy, Boolean, null: false
    field :history, Boolean, null: false
    field :horror, Boolean, null: false
    field :music, Boolean, null: false
    field :mystery, Boolean, null: false
    field :romance, Boolean, null: false
    field :science_fiction, Boolean, null: false
    field :tv_movie, Boolean, null: false
    field :thriller, Boolean, null: false
    field :war, Boolean, null: false
    field :western, Boolean, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
