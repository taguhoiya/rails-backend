# frozen_string_literal: true

module Types
  class NotificationType < Types::BaseObject
    field :id, ID, null: false
    field :visitor_id, Integer, null: false
    field :visited_id, Integer, null: false
    field :mark_id, Integer, null: true
    field :comment_id, Integer, null: true
    field :visitor, Types::UserType, null: true
    field :visited, Types::UserType, null: true
    field :mark, Types::MarkType, null: true
    field :comment, Types::CommentType, null: true
    field :action, String, null: false
    field :checked, Boolean, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
