# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    item_type { 'product' }
    sequence(:identifier) { |n| "#{Faker::Food.dish}-#{n}" }
    label { Faker::Food.dish }
    description { Faker::Food.description }
    price { Faker::Number.decimal(l_digits: 2) }

    trait :product do
      item_type { 'product' }
    end

    trait :component do
      item_type { 'component' }
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
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_items_on_item_type         (item_type)
#  index_items_on_lower_identifier  (lower((identifier)::text)) UNIQUE
#
