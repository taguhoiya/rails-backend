# frozen_string_literal: true

module Mutations
  class DeleteComment < BaseMutation
    type String

    argument :id, ID, required: true
    def resolve(id:)
      Comment.find(id).delete
      'DELETE COMPLETE'
    end
  end
end
