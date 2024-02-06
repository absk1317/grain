# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    item_type { 'Product' }
    identifier { Faker::Lorem.unique.word }
    label { Faker::Lorem.unique.word }
    description { Faker::Lorem.unique.word }
    price { Faker::Number.decimal(l_digits: 2) }

    trait :product do
      item_type { 'Product' }
    end

    trait :component do
      item_type { 'Component' }
    end
  end
end

# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  item_type   :enum             default("product"), not null
#  identifier  :string           not null
#  label       :string           not null
#  description :string           not null
#  price       :decimal(10, 2)   not null
#  deleted_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
