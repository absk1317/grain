# frozen_string_literal: true

class AddMissingIndexesOnModifierGroups < ActiveRecord::Migration[7.1]
  def change
    add_index :modifier_groups, 'lower(identifier)', unique: true
  end
end
