# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Menu do
  describe 'associations' do
    it { is_expected.to have_many(:menu_sections).dependent(:destroy).inverse_of(:menu) }
    it { is_expected.to have_many(:sections).through(:menu_sections) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:label) }
    it { is_expected.to validate_presence_of(:identifier) }
    it { is_expected.to validate_presence_of(:state) }
  end
end
