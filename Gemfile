# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
# Use postgresql as the database for Active Record
gem 'pg', '1.2.3'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capistrano'
  gem 'capistrano3-unicorn'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'bullet'
  gem 'graphiql-rails'
  gem 'pre-commit', require: false
  gem 'pry-rails'
  gem 'rails-erd'
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'spring'
end

group :production do
  gem 'unicorn'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# This is for authentication based on token
gem 'devise'
gem 'devise_token_auth'

gem 'solargraph'

gem 'rspec'
gem 'rspec-rails'

gem 'apollo_upload_server'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'faker'
gem 'graphql'
gem 'graphql-batch'
gem 'graphql_devise'
gem 'graphql-errors'
gem 'image_processing'
gem 'kaminari'

gem 'aws-sdk-rails', '~> 3.6'
