# frozen_string_literal: true

FactoryBot.define do
  factory :section do
    identifier { Faker::Lorem.unique.word }
    label { Faker::Lorem.unique.word }
    description { Faker::Lorem.unique.word }
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
