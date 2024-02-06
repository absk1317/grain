# frozen_string_literal: true

class CreateModifiers < ActiveRecord::Migration[7.1]
  def change
    create_table :modifiers do |t|
      t.references :modifier_group, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.integer :display_order, null: false, default: 0
      t.integer :display_quantity, null: false, default: 0

      t.decimal :price_override, precision: 10, scale: 2, null: false, default: 0.0

      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
