# frozen_string_literal: true

FactoryBot.define do
  factory :section_item do
    section
    item
    display_order { 1 }
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
#  index_section_items_on_item_id                       (item_id)
#  index_section_items_on_item_id_and_section_id        (item_id,section_id) UNIQUE
#  index_section_items_on_section_id                    (section_id)
#  index_section_items_on_section_id_and_item_id        (section_id,item_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (section_id => sections.id)
#
