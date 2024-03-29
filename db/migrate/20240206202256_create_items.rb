# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.1]
  def up
    create_enum :item_type, %w[product component]

    create_table :items do |t|
      t.enum :item_type, enum_type: 'item_type', default: 'product', null: false
      t.string :identifier, null: false
      t.string :label, null: false
      t.string :description, null: false
      t.decimal :price, precision: 10, scale: 2, null: false

      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end

  def down
    drop_table :items
    execute('DROP TYPE item_type;')
  end
end
