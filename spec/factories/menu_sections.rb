# frozen_string_literal: true

FactoryBot.define do
  factory :menu_section do
    menu
    section
    display_order { 1 }
  end
end

# == Schema Information
#
# Table name: menu_sections
#
#  id            :bigint           not null, primary key
#  menu_id       :bigint           not null
#  section_id    :bigint           not null
#  display_order :integer          default(0), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_menu_sections_on_display_order_and_menu_id  (display_order,menu_id) UNIQUE
#  index_menu_sections_on_menu_id                    (menu_id)
#  index_menu_sections_on_menu_id_and_section_id     (menu_id,section_id) UNIQUE
#  index_menu_sections_on_section_id                 (section_id)
#  index_menu_sections_on_section_id_and_menu_id     (section_id,menu_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (menu_id => menus.id)
#  fk_rails_...  (section_id => sections.id)
#
