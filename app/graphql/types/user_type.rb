# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :provider, String, null: false
    field :uid, String, null: false
    field :encrypted_password, String, null: false
    field :reset_password_token, String, null: true
    field :reset_password_sent_at, GraphQL::Types::ISO8601DateTime, null: true
    field :allow_password_change, Boolean, null: true
    field :remember_created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :confirmation_token, String, null: true
    field :confirmed_at, GraphQL::Types::ISO8601DateTime, null: true
    field :confirmation_sent_at, GraphQL::Types::ISO8601DateTime, null: true
    field :unconfirmed_email, String, null: true
    field :name, String, null: true
    field :nickname, String, null: true
    field :image, String, null: true
    field :email, String, null: true
    field :tokens, GraphQL::Types::JSON, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :clips, [Types::ClipType], null: false
    field :marks, [Types::MarkType], null: false
    field :mark_drafts, [Types::MarkDraftType], null: false
    field :comments, [Types::CommentType], null: false
    field :favorites, [Types::FavoriteType], null: false
    field :follower, [Types::RelationshipType], null: false
    field :followed, [Types::RelationshipType], null: false
    field :path, String, null: true
    field :content_type, String, null: true

    def clips
      Loaders::AssociationLoader.for(User, :clips).load(object)
    end

    def marks
      Loaders::AssociationLoader.for(User, :marks).load(object)
    end

    def mark_drafts
      Loaders::AssociationLoader.for(User, :mark_drafts).load(object)
    end

    def comments
      Loaders::AssociationLoader.for(User, :comments).load(object)
    end

    def favorites
      Loaders::AssociationLoader.for(User, :favorites).load(object)
    end
  end
end
