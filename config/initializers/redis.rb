# frozen_string_literal: true

REDIS = ConnectionPool.new(size: 20) { MockRedis.new }
