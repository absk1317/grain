# frozen_string_literal: true

FactoryBot.define do
  factory :item_modifier_group do
    item
    modifier_group
  end
end

# == Schema Information
#
# Table name: item_modifier_groups
#
#  id                :bigint           not null, primary key
#  item_id           :bigint           not null
#  modifier_group_id :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_item_modifier_groups_on_item_id_and_modifier_group_id  (item_id,modifier_group_id) UNIQUE
#  index_item_modifier_groups_on_modifier_group_id              (modifier_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (modifier_group_id => modifier_groups.id)
#
