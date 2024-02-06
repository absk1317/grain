# frozen_string_literal: true

class Modifier < ApplicationRecord
  belongs_to :modifier_group, inverse_of: :modifiers
  belongs_to :item, inverse_of: :modifiers

  validates :display_order, :display_quantity, :price_override, presence: true
  validates :display_order, :display_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :price_override, numericality: { greater_than_or_equal_to: 0 }
end

# == Schema Information
#
# Table name: modifiers
#
#  id                :bigint           not null, primary key
#  modifier_group_id :bigint           not null
#  item_id           :bigint           not null
#  display_order     :integer          default(0), not null
#  display_quantity  :integer          default(0), not null
#  price_override    :decimal(10, 2)   default(0.0), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_modifiers_on_item_id            (item_id)
#  index_modifiers_on_modifier_group_id  (modifier_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (modifier_group_id => modifier_groups.id)
#
