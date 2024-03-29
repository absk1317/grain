# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'rails', '~> 7.1.3'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'tzinfo-data', platforms: %i[windows jruby]
gem 'graphql'
gem 'goldiloader'

# performance and monitoring
gem 'lograge'
gem 'logstash-event'
gem 'logstash-logger'
gem 'sentry-ruby'
gem 'sentry-rails'
gem 'newrelic_rpm'

# caching
gem 'redis'
gem 'identity_cache'
gem 'cityhash' # for faster hashing
gem 'dalli'

# for seed data
gem 'factory_bot_rails'
gem 'faker'

group :development do
  gem 'annotate'
  gem 'mina'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'amazing_print'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'brakeman'
  gem 'bullet'
  gem 'pry'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'rubocop-performance'
  gem 'rubocop-graphql'
end

group :test do
  gem 'database_cleaner'
  gem 'json-schema'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end
