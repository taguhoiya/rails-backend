# frozen_string_literal: true

module Mutations
  class CreateFavo < BaseMutation
    field :favorite, Types::FavoriteType, null: true
    field :user, Types::UserType, null: true
    field :mark, Types::MarkType, null: true

    argument :mark_id, ID, required: true
    argument :user_id, ID, required: true
    def resolve(**args)
      mark = Mark.find(args[:mark_id])
      user = User.find(args[:user_id])
      favo = mark.favorites.build(mark_id: args[:mark_id], user_id: args[:user_id])
      favo.save!
      favo_h = favo.attributes
      {
        favorite: favo_h,
        mark: mark,
        user: user
      }
    end
  end
end
