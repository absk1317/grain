# frozen_string_literal: true

class Section < ApplicationRecord
  has_many :menu_sections, dependent: :destroy, inverse_of: :section
  has_many :menus, through: :menu_sections
  has_many :section_items, dependent: :destroy, inverse_of: :section
  has_many :items, through: :section_items

  validates :identifier, :label, :description, presence: true
end

# == Schema Information
#
# Table name: sections
#
#  id          :bigint           not null, primary key
#  identifier  :string           not null
#  label       :string           not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
