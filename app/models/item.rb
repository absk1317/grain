# frozen_string_literal: true

class Item < ApplicationRecord
  enum item_type: { product: 'product', component: 'component' }

  has_many :item_modifier_groups, dependent: :destroy, inverse_of: :item
  has_many :modifier_groups, through: :item_modifier_groups
  has_many :modifiers, through: :modifier_groups

  has_many :section_items, dependent: :destroy, inverse_of: :item
  has_many :sections, through: :section_items

  validates :item_type, :identifier, :label, :description, :price, presence: true

  scope :products, -> { where(item_type: :product) }
  scope :components, -> { where(item_type: :component) }

  def item_modifier_groups
    key = "item_#{id}::ItemModifierGroup"
    RedisCache.relation_cache(key:, klass: ItemModifierGroup) { super }
  end

  def modifier_groups = RedisCache.relation_cache(key: "item_#{id}::ModifierGroup", klass: ModifierGroup) { super }
  def modifiers = RedisCache.relation_cache(key: "item_#{id}::Modifier", klass: Modifier) { super }
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
