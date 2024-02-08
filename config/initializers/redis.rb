# frozen_string_literal: true

pool_size = Rails.application.credentials.dig(:database, :redis, :pool_size) || 20

# host = Rails.application.credentials.dig(:database, :redis, :cache_host) || '127.0.0.1'
# port = Rails.application.credentials.dig(:database, :redis, :port) || '6379'

# if Rails.env.test?
#   require 'mock_redis'
#   REDIS = ConnectionPool.new(size: pool_size.to_i) { MockRedis.new }
# else
#   REDIS = ConnectionPool.new(size: pool_size.to_i) do
#     Redis.new(host:, port: port.to_i)
#   end
# end

require 'mock_redis'
REDIS = ConnectionPool.new(size: pool_size.to_i) { MockRedis.new }
