# frozen_string_literal: true

FactoryBot.define do
  factory :modifier_group do
    sequence(:identifier) { |n| "modifier-group-#{n}" }
    label { Faker::Food.ingredient }
    min_selections { 0 }
    max_selections { 1 }
  end
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
# Indexes
#
#  index_modifier_groups_on_lower_identifier  (lower((identifier)::text)) UNIQUE
#
