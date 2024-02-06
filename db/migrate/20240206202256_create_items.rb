# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.1]
  def up
    create_enum :item_type, %w[Product Component]

    create_table :items do |t|
      t.enum :item_type, enum_type: 'item_type', default: 'Product', null: false
      t.string :identifier, null: false
      t.string :label, null: false
      t.string :description, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.datetime :deleted_at

      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end

  def down
    drop_table :items
    execute('DROP TYPE item_type;')
  end
end
