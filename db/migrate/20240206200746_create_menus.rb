# frozen_string_literal: true

class CreateMenus < ActiveRecord::Migration[7.1]
  def change
    create_table :menus do |t|
      t.string :identifier, null: false
      t.string :label, null: false
      t.string :state, null: false, index: true

      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }

      t.index 'lower(identifier)', unique: true
      t.index %i[start_date end_date]
    end
  end
end
