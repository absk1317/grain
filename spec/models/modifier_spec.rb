# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Modifier do
  describe 'associations' do
    it { is_expected.to belong_to(:modifier_group).inverse_of(:modifiers) }
    it { is_expected.to belong_to(:item).inverse_of(:modifiers) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:display_order) }
    it { is_expected.to validate_presence_of(:display_quantity) }
    it { is_expected.to validate_presence_of(:price_override) }
    it { is_expected.to validate_numericality_of(:display_order).only_integer.is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:display_quantity).only_integer.is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:price_override).is_greater_than_or_equal_to(0) }
  end

  describe 'indexes' do
    it { is_expected.to have_db_index(:item_id) }
    it { is_expected.to have_db_index(:modifier_group_id) }
  end
end
