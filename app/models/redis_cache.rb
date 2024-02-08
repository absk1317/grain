# frozen_string_literal: true

class RedisCache
  class << self
    DEFAULT_EXPIRY =
      case Rails.env
      when 'development'
        600
      when 'test'
        1
      else
        30
      end

    # if value is present in cache, return it
    # if value is not present in cache, get it from db and store in cache
    def relation_cache(key:, expiry: 600, klass: nil, &)
      value = find(key)

      deserialized_value = deserialize_relation(value, klass)
      return deserialized_value if deserialized_value.present?

      value = yield
      dump(key, value, expiry)
      value
    end

    def object_cache(key:, expiry: 600, klass: nil)
      value = find(key)

      deserialized_value = deserialize_object(value, klass)
      return deserialized_value if deserialized_value.present?

      value = yield
      dump(key, value, expiry)
      value
    end

    def delete(key) = REDIS.with { |conn| conn.del(key) }

    def find(key)
      value = nil
      REDIS.with { |conn| value = conn.get(key) }
      return unless value

      parsed_data(value)
    end

    def parsed_data(json_data)
      JSON.parse(json_data) # We are trying to parse because while storing, we are storing as json
    rescue StandardError
      json_data
    end

    def dump(key, value, expiry = 60)
      REDIS.with do |conn|
        conn.set(key, value.to_json)
        conn.expire(key, expiry.to_i) unless expiry == :infinity
      end
      value
    end

    def deserialize_relation(data, klass)
      return unless data
      return data unless klass

      stale_keys = data.map { |attrs| "#{klass}::#{attrs['id']}::stale" }
      stale_values = find_all(stale_keys)
      # if any of the stale values are present, then the relation is stale
      if stale_values.any?
        REDIS.with { |conn| conn.del(*stale_keys) }
        Rails.logger.info 'Relation is stale, so deleting the stale keys'
        return
      end

      data.map { |attrs| klass.new(attrs) }
    end

    def deserialize_object(data, klass)
      return unless data && klass

      record = klass.new(data)
      stale_key = "#{klass}::#{record.id}::stale"
      if find(stale_key).present?
        REDIS.with { |conn| conn.del(stale_key) }
        Rails.logger.info 'Object is stale, so deleting the stale key'
        return
      end

      # This is to make sure that the record is not treated as new record
      record.instance_variable_set(:@new_record, false)
      record
    end

    def find_all(args)
      values = []
      return values if args.blank?

      REDIS.with { |conn| values = conn.mget(args) }
      values.map { |value| parsed_data(value) }
    end
  end
end
