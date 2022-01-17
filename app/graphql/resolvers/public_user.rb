# frozen_string_literal: true

module Resolvers
  class PublicUser < Resolvers::BaseResolver
    type Types::UserType, null: false
    argument :id, Int, required: true
    def resolve(id:)
      User.find(id)
    end
  end
end
