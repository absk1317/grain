# frozen_string_literal: true

class Section < ApplicationRecord
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
