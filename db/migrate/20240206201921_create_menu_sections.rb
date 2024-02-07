# frozen_string_literal: true

class CreateMenuSections < ActiveRecord::Migration[7.1]
  def change
    create_table :menu_sections do |t|
      t.references :menu, null: false, foreign_key: true, index: false
      t.references :section, null: false, foreign_key: true, index: false
      t.integer :display_order, null: false, default: 0

      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }

      # unique index for menu_id and section_id
      t.index %i[menu_id section_id], unique: true
      t.index %i[section_id menu_id], unique: true

      # unique index for display_order within a menu
      t.index %i[display_order menu_id], unique: true
    end
  end
end
