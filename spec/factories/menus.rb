# frozen_string_literal: true

FactoryBot.define do
  factory :menu do
    sequence(:identifier) { |n| "menu-#{n}" }
    label { Faker::Restaurant.name }
    state { 'active' }
    start_date { Faker::Date.between(from: 1.year.ago, to: 1.month.ago) }
    end_date { Faker::Date.between(from: 1.month.from_now, to: 1.year.from_now) }
  end
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
