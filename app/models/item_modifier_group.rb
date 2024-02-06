# frozen_string_literal: true

class ItemModifierGroup < ApplicationRecord
  belongs_to :item, inverse_of: :item_modifier_groups
  belongs_to :modifier_group, inverse_of: :item_modifier_groups
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
#  index_item_modifier_groups_on_item_id            (item_id)
#  index_item_modifier_groups_on_modifier_group_id  (modifier_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (modifier_group_id => modifier_groups.id)
#
