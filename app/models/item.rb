# frozen_string_literal: true

class Item < ApplicationRecord
  enum item_type: { product: 'product', component: 'component' }

  has_many :item_modifier_groups, dependent: :destroy, inverse_of: :item
  has_many :modifier_groups, through: :item_modifier_groups

  has_many :section_items, dependent: :destroy, inverse_of: :item
  has_many :sections, through: :section_items

  validates :item_type, :identifier, :label, :description, :price, presence: true

  scope :products, -> { where(item_type: :product) }
  scope :components, -> { where(item_type: :component) }
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
