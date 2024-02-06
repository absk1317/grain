# frozen_string_literal: true

class Menu < ApplicationRecord
  has_many :menu_sections, dependent: :destroy, inverse_of: :menu
  has_many :sections, through: :menu_sections
  has_many :items, through: :sections

  validates :identifier, :label, :state, presence: true
end

# == Schema Information
#
# Table name: menus
#
#  id         :bigint           not null, primary key
#  identifier :string           not null
#  label      :string           not null
#  state      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
