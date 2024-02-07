# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemModifierGroup do
  describe 'associations' do
    it { is_expected.to belong_to(:item).inverse_of(:item_modifier_groups) }
    it { is_expected.to belong_to(:modifier_group).inverse_of(:item_modifier_groups) }
  end

  describe 'indexes' do
    it { is_expected.to have_db_index(:item_id) }
    it { is_expected.to have_db_index(:modifier_group_id) }
  end
end
