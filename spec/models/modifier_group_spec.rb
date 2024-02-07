# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ModifierGroup do
  describe 'associations' do
    it { is_expected.to have_many(:item_modifier_groups).dependent(:destroy).inverse_of(:modifier_group) }
    it { is_expected.to have_many(:items).through(:item_modifier_groups) }
    it { is_expected.to have_many(:modifiers).inverse_of(:modifier_group).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:label) }
    it { is_expected.to validate_presence_of(:identifier) }
    it { is_expected.to validate_presence_of(:min_selections) }
    it { is_expected.to validate_numericality_of(:min_selections).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:max_selections).is_greater_than_or_equal_to(0) }
  end

  describe 'indexes' do
    it { is_expected.to have_db_index('lower((identifier)::text)').unique }
  end
end
