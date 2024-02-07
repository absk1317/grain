# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'SectionsQuery', type: :graphql do
  describe 'sections' do
    let(:sections_list_query) do
      <<~GQL
        query {
          sections {
            id
            label
            identifier
            description
          }
        }
      GQL
    end

    let(:section_show_query) do
      <<~GQL
        query {
          section(id: section_id) {
            id
            label
            identifier
            description
          }
        }
      GQL
    end

    it 'returns all sections' do
      _sections = create_list(:section, 2)
      result = execute_graphql(sections_list_query)
      sections = result.dig('data', 'sections')

      expect(sections.count).to eq(2)
    end

    it 'returns a single section' do
      section = create(:section)
      result = execute_graphql(section_show_query.sub('section_id', section.id.to_s))
      section_result = result.dig('data', 'section')
      expect(section_result['id']).to eq(section.id.to_s)
    end
  end
end
