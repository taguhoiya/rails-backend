# frozen_string_literal: true

include GraphqlDevise::MailerHelper
Rails.application.routes.draw do
  mount_graphql_devise_for User, at: '/graphql_auth', operations: {
    login: Mutations::Login,
    register: Mutations::Register
  }, additional_queries: {
    public_user: Resolvers::PublicUser
  }

  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'
end
