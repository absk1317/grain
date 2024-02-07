# frozen_string_literal: true

class SectionItem < ApplicationRecord
  belongs_to :section, inverse_of: :section_items
  belongs_to :item, inverse_of: :section_items

  has_many :item_modifier_groups, through: :item
  has_many :modifier_groups, through: :item_modifier_groups

  validates :section_id, uniqueness: { scope: :item_id }
  validates :display_order, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :display_order, uniqueness: { scope: :section_id }

  def item_modifier_groups
    RedisCache.relation_cache(key: "section_items_#{id}::ItemModifierGroup",
                              klass: ItemModifierGroup) do
      super
    end
  end

  def modifier_groups
    RedisCache.relation_cache(key: "section_items_#{id}::ModifierGroup", klass: ModifierGroup) do
      super
    end
  end
end

# == Schema Information
#
# Table name: section_items
#
#  id            :bigint           not null, primary key
#  section_id    :bigint           not null
#  item_id       :bigint           not null
#  display_order :integer          default(0), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_section_items_on_display_order_and_section_id  (display_order,section_id) UNIQUE
#  index_section_items_on_item_id_and_section_id        (item_id,section_id) UNIQUE
#  index_section_items_on_section_id_and_item_id        (section_id,item_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (section_id => sections.id)
#
