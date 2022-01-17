# frozen_string_literal: true

module Mutations
  class Register < GraphqlDevise::Mutations::SignUp
    argument :nickname, String, required: true

    field :user, Types::UserType, null: true

    def resolve(email:, **attrs)
      original_payload = super
      original_payload.merge(user: original_payload[:authenticatable])
    end
  end
end
