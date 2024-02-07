# frozen_string_literal: true

class CreateItemModifierGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :item_modifier_groups do |t|
      t.references :item, null: false, foreign_key: true, index: false
      t.references :modifier_group, null: false, foreign_key: true

      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }

      t.index %i[item_id modifier_group_id], unique: true
    end
  end
end
