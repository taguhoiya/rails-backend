# frozen_string_literal: true

module Types
  class ErrorType < Types::BaseObject
    description 'A user-readable error'

    field :message, String, null: false,
                            description: 'A description of the error'
    field :path, [String], null: false,
                           description: 'Which input value this error came from'
  end
end
