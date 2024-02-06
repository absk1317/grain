# frozen_string_literal: true

class Item < ApplicationRecord
end

# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  item_type   :enum             default("Product"), not null
#  identifier  :string           not null
#  label       :string           not null
#  description :string           not null
#  price       :decimal(10, 2)   not null
#  deleted_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
