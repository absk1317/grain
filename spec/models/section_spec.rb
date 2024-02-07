# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Section do
  describe 'associations' do
    it { is_expected.to have_many(:menu_sections).dependent(:destroy).inverse_of(:section) }
    it { is_expected.to have_many(:menus).through(:menu_sections) }
    it { is_expected.to have_many(:section_items).dependent(:destroy).inverse_of(:section) }
    it { is_expected.to have_many(:items).through(:section_items) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:identifier) }
    it { is_expected.to validate_presence_of(:label) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
