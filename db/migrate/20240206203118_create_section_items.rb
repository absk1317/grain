# frozen_string_literal: true

class CreateSectionItems < ActiveRecord::Migration[7.1]
  def change
    create_table :section_items do |t|
      t.references :section, null: false, foreign_key: true, index: false
      t.references :item, null: false, foreign_key: true, index: false
      t.integer :display_order, null: false, default: 0

      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }

      t.index %i[section_id item_id], unique: true
      t.index %i[item_id section_id], unique: true

      t.index %i[display_order section_id], unique: true
    end
  end
end
