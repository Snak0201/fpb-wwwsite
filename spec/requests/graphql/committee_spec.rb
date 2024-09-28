require 'rails_helper'

RSpec.describe 'Committee' do
  subject(:request) { post '/graphql', params: { query: } }

  describe 'committees query' do
    subject(:result) { JSON.parse(response.body, symbolize_names: true).dig(:data, :committees) }

    # NOTE: 3-1-5-2-4の順が正しい
    let!(:first_committee) { create(:committee) }
    let!(:second_committee) { create(:committee, :with_bureau) }
    let!(:third_committee) { create(:committee, :special) }
    let!(:fourth_committee) { create(:committee, :with_bureau) }
    let!(:fifth_committee) { create(:committee, :with_bureau, :special, bureau: Bureau.first) }

    let(:query) do
      <<~QUERY
        {
          committees{
            name
          }
        }
      QUERY
    end

    let(:expected_data) do
      [{ name: third_committee.name }, { name: first_committee.name }, { name: fifth_committee.name },
       { name: second_committee.name }, { name: fourth_committee.name }]
    end

    it 'returns expected_data' do
      request
      expect(result).to eq expected_data
    end
  end

  describe 'committee query' do
    subject(:result) { JSON.parse(response.body, symbolize_names: true).dig(:data, :committee) }

    let!(:committee) { create(:committee, :with_bureau, :special) }
    let!(:article) { create(:article, committees: [committee]) }
    let(:query) do
      <<~QUERY
        {
          committee(slug: "#{committee.slug}"){
            name
            special
            bureau{
              name
            }
            articles(first: 5){
              nodes{
                title
              }
            }
          }
        }
      QUERY
    end

    let(:expected_data) do
      {
        name: committee.name,
        special: true,
        bureau:{
          name: committee.bureau.name
        },
        articles: {
          nodes: [
            { title: article.title }
          ]
        }
      }
    end

    it do
      request
      expect(result).to eq expected_data
    end
  end
end
