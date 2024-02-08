# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  after_commit :clear_cache

  def self.fetch(id) = RedisCache.object_cache(key: "#{name}::#{id}", klass: self) { find(id) }

  def clear_cache
    RedisCache.delete("#{self.class}::#{id}")

    self.class.reflect_on_all_associations.each do |association|
      next unless association.klass < ApplicationRecord

      RedisCache.dump("#{self.class}::#{id}::stale", true, :infinity)

      # TODO: issue with has_many through and has_many associations. Need to fix it.
      # Till then, we are not clearing cache for has_many through and has_many associations
      # It will be auto cleaned up after 30 seconds
      # ALso cleanup on record destroy is not working
      # RedisCache.dump("#{association.klass}::#{send(association.foreign_key)}::stale", true, :infinity)
    end
  end
end
