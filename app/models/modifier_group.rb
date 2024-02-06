# frozen_string_literal: true

class ModifierGroup < ApplicationRecord
  has_many :item_modifier_groups, dependent: :destroy, inverse_of: :modifier_group
  has_many :items, through: :item_modifier_groups
  has_many :modifiers, dependent: :destroy, inverse_of: :modifier_group

  validates :identifier, :label, :min_selections, :max_selections, presence: true
  validates :min_selections, :max_selections, numericality: { greater_than_or_equal_to: 0 }
  validates :min_selections, numericality: { less_than_or_equal_to: :max_selections }
end

# == Schema Information
#
# Table name: modifier_groups
#
#  id             :bigint           not null, primary key
#  identifier     :string           not null
#  label          :string           not null
#  min_selections :integer          default(0), not null
#  max_selections :integer          default(1), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
