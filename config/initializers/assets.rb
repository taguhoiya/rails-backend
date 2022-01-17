# frozen_string_literal: true

if Rails.env.development?
  Rails.application.config.assets.precompile += %w[graphiql/rails/application.js
                                                   graphiql/rails/application.css]
end
