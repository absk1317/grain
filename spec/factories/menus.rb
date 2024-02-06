# frozen_string_literal: true

FactoryBot.define do
  factory :menu do
    identifier { Faker::Lorem.unique.word }
    label { Faker::Lorem.unique.word }
    state { 'active' }
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
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
