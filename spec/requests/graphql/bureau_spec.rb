require 'rails_helper'

RSpec.describe 'Bureau' do
  describe 'POST /graphql' do
    subject(:request) { post '/graphql', params: { query: } }

    before do
      create_list(:bureau, 3)
    end

    context 'when requests bureaus query' do
      let(:response_data) { JSON.parse(response.body, symbolize_names: true).dig(:data, :bureaus) }
      let(:query) do
        <<~QUERY
          {
            bureaus{
              id
              name
            }
          }
        QUERY
      end

      let(:expected_data) do
        Bureau.all.map do |bureau|
          { id: bureau.id.to_s, name: bureau.name }
        end
      end

      it 'has correct data' do
        request
        expect(response_data).to eq expected_data
      end
    end

    context 'when requests bureau query' do
      let(:bureau) { Bureau.first }
      let(:response_data) { JSON.parse(response.body, symbolize_names: true).dig(:data, :bureau) }
      let(:query) do
        <<~QUERY
          {
            bureau(slug: "#{bureau.slug}"){
              id
              name
            }
          }
        QUERY
      end

      let(:expected_data) do
        {
          id: bureau.id.to_s,
          name: bureau.name
        }
      end

      it 'has correct data' do
        request
        expect(response_data).to eq expected_data
      end
    end
  end
end
