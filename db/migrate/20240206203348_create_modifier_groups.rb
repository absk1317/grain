class CreateModifierGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :modifier_groups do |t|
      t.string :identifier, null: false
      t.string :label, null: false
      t.integer :min_selections, null: false, default: 0
      t.integer :max_selections, null: false, default: 1

      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
