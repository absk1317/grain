# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MenuSection do
  describe 'associations' do
    it { is_expected.to belong_to(:menu).inverse_of(:menu_sections) }
    it { is_expected.to belong_to(:section).inverse_of(:menu_sections) }

    it { is_expected.to have_many(:section_items).through(:section) }
    it { is_expected.to have_many(:items).through(:section_items) }
  end

  describe 'validations' do
    it 'validates uniqueness of section_id scoped to menu_id' do
      menu_section_old = create(:menu_section)
      menu_section = build(:menu_section, menu: menu_section_old.menu, section: menu_section_old.section)
      expect(menu_section).to validate_uniqueness_of(:section_id).scoped_to(:menu_id)
    end
  end

  describe 'indexes' do
    it { is_expected.to have_db_index(%i[display_order menu_id]).unique }
    it { is_expected.to have_db_index(%i[menu_id section_id]).unique }
    it { is_expected.to have_db_index(%i[section_id menu_id]).unique }
  end
end
