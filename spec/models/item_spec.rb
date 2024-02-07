# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item do
  describe 'associations' do
    it { is_expected.to have_many(:item_modifier_groups).dependent(:destroy).inverse_of(:item) }
    it { is_expected.to have_many(:modifier_groups).through(:item_modifier_groups) }
    it { is_expected.to have_many(:modifiers).inverse_of(:item).dependent(:destroy) }

    it { is_expected.to have_many(:section_items).dependent(:destroy).inverse_of(:item) }
    it { is_expected.to have_many(:sections).through(:section_items) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:item_type) }
    it { is_expected.to validate_presence_of(:identifier) }
    it { is_expected.to validate_presence_of(:label) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
  end

  describe 'scopes' do
    it { expect(described_class).to respond_to(:products) }
    it { expect(described_class).to respond_to(:components) }
  end

  describe 'indexes' do
    it { is_expected.to have_db_index(:item_type) }
    it { is_expected.to have_db_index('lower((identifier)::text)').unique }
  end
end
