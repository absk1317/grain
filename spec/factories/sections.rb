# frozen_string_literal: true

FactoryBot.define do
  factory :section do
    sequence(:identifier) { |n| "section-#{n}" }
    label { Faker::Restaurant.type }
    description { Faker::Restaurant.description }
  end
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
# Indexes
#
#  index_sections_on_lower_identifier  (lower((identifier)::text)) UNIQUE
#
