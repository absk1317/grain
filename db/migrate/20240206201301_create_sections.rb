# frozen_string_literal: true

class CreateSections < ActiveRecord::Migration[7.1]
  def change
    create_table :sections do |t|
      t.string :identifier,   null: false
      t.string :label,        null: false
      t.string :description, null: false

      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.index 'lower(identifier)', unique: true
    end
  end
end
