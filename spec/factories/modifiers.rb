# frozen_string_literal: true

FactoryBot.define do
  factory :modifier do
    modifier_group
    item
    display_order { 1 }
    default_quantity { 1 }
    price_override { 0.0 }
  end
end

# == Schema Information
#
# Table name: modifiers
#
#  id                :bigint           not null, primary key
#  modifier_group_id :bigint           not null
#  item_id           :bigint           not null
#  display_order     :integer          default(0), not null
#  default_quantity  :integer          default(0), not null
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
