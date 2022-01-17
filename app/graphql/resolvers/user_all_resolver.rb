# frozen_string_literal: true

module Resolvers
  class UserAllResolver < Resolvers::BaseResolver
    type [Types::UserType], null: false
    def resolve
      User.all
    end
  end
end
