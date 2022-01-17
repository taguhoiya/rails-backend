# frozen_string_literal: true

module Mutations
  class UpdateMark < BaseMutation
    field :mark, Types::MarkType, null: true
    field :result, Boolean, null: true

    argument :id, ID, required: true
    argument :score, Float, required: true
    argument :content, String, required: false
    def resolve(**args)
      mark = Mark.find(args[:id])

      mark.update(score: args[:score], content: args[:content])
      mark_h = mark.attributes
      mark_h[:movie] = Movie.find(mark.movie_id).attributes
      mark_h[:user] = User.find(mark.user_id).attributes
      {
        mark: mark_h,
        result: mark.errors.blank?
      }
    end
  end
end
