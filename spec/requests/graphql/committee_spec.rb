require 'rails_helper'

RSpec.describe 'Committee' do
  subject(:request) { post '/graphql', params: { query: } }

  # NOTE: 3-1-5-2-4の順が正しい
  let!(:first_committee) { create(:committee) }
  let!(:second_committee) { create(:committee, :with_bureau) }
  let!(:third_committee) { create(:committee, :special) }
  let!(:fourth_committee) { create(:committee, :with_bureau) }
  let!(:fifth_committee) { create(:committee, :with_bureau, :special, bureau: Bureau.first) }

  describe 'committees query' do
    subject(:result) { JSON.parse(response.body, symbolize_names: true).dig(:data, :committees) }

    let(:query) do
      <<~QUERY
        {
          committees{
            id
          }
        }
      QUERY
    end

    let(:expected_data) do
      [{ id: third_committee.id.to_s }, { id: first_committee.id.to_s }, { id: fifth_committee.id.to_s },
       { id: second_committee.id.to_s }, { id: fourth_committee.id.to_s }]
    end

    it 'returns expected_data' do
      request
      expect(result).to eq expected_data
    end
  end
end
