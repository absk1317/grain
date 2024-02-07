# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SectionItem do
  describe 'associations' do
    it { is_expected.to belong_to(:section).inverse_of(:section_items) }
    it { is_expected.to belong_to(:item).inverse_of(:section_items) }

    it { is_expected.to have_many(:item_modifier_groups).through(:item) }
    it { is_expected.to have_many(:modifier_groups).through(:item_modifier_groups) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:display_order) }
    it { is_expected.to validate_numericality_of(:display_order).only_integer.is_greater_than_or_equal_to(0) }

    it 'validates uniqueness of section_id scoped to item_id' do
      existing_record = create(:section_item)
      new_record = build(:section_item, section: existing_record.section, item: existing_record.item)
      expect(new_record).to validate_uniqueness_of(:section_id).scoped_to(:item_id)
    end

    it 'validates uniqueness of display_order scoped to section_id' do
      existing_record = create(:section_item)
      new_record = build(:section_item, section: existing_record.section, display_order: existing_record.display_order)
      expect(new_record).to validate_uniqueness_of(:display_order).scoped_to(:section_id)
    end
  end
end
