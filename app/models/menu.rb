# frozen_string_literal: true

class Menu < ApplicationRecord
  has_many :menu_sections, dependent: :destroy, inverse_of: :menu
  has_many :sections, through: :menu_sections
  has_many :items, through: :sections

  validates :identifier, :label, :state, presence: true

  def menu_sections = RedisCache.relation_cache(key: "menu_#{id}::MenuSection", klass: MenuSection) { super }
  def sections = RedisCache.relation_cache(key: "menu_#{id}::Section", klass: Section) { super }
  def items = RedisCache.relation_cache(key: "menu_#{id}::Item", klass: Item) { super }
end

# == Schema Information
#
# Table name: menus
#
#  id         :bigint           not null, primary key
#  identifier :string           not null
#  label      :string           not null
#  state      :string           not null
#  start_date :date             not null
#  end_date   :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_menus_on_lower_identifier         (lower((identifier)::text)) UNIQUE
#  index_menus_on_start_date_and_end_date  (start_date,end_date)
#  index_menus_on_state                    (state)
#
