# frozen_string_literal: true

class AddMissingIndexesOnItems < ActiveRecord::Migration[7.1]
  def change
    add_index :items, :item_type
    add_index :items, 'lower(identifier)', unique: true
  end
end
