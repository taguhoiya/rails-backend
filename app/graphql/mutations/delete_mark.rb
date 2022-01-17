# frozen_string_literal: true

module Mutations
  class DeleteMark < BaseMutation
    type String

    argument :id, ID, required: true
    def resolve(id:)
      Mark.find(id).destroy
      'DELETE COMPLETE'
    end
  end
end
