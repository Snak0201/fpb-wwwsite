require 'rails_helper'

RSpec.describe 'Article' do
  subject(:response_nodes) { response_data[:nodes] }

  let(:request) { post '/graphql', params: { query: } }

  let(:response_data) { JSON.parse(response.body, symbolize_names: true).dig(:data, :articles) }

  describe 'articles query' do
    context 'when requests articles query' do
      before do
        create_list(:article, 7, :published)
        create_list(:article, 3)
      end

      let(:query) do
        <<~QUERY
          {
            articles(first: 10){
              nodes{
                id
                title
                content
                number
              }
            }
          }
        QUERY
      end

      let(:expected_data) do
        { nodes: Article.where.not(published_at: nil).order(published_at: :desc).map do |article|
          { id: article.id.to_s, title: article.title, content: article.content, number: article.number }
        end }
      end

      it 'has published articles and sorted new published at' do
        request
        expect(response_nodes.length).to eq 7
        expect(response_data).to eq expected_data
      end
    end

    context 'when requests articles query small first' do
      before do
        create_list(:article, 7, :published)
        create_list(:article, 3)
      end

      let(:query) do
        <<~QUERY
          {
            articles(first: 3){
              nodes{
                id
                title
                content
                number
              }
            }
          }
        QUERY
      end

      let(:expected_data) do
        { nodes: Article.where.not(published_at: nil).order(published_at: :desc).limit(3).map do |article|
          { id: article.id.to_s, title: article.title, content: article.content, number: article.number }
        end }
      end

      it 'has specified number of articles in first' do
        request
        expect(response_nodes.length).to eq 3
        expect(response_data).to eq expected_data
      end
    end

    context 'when article has jurisdiction bureaus and committees' do
      let!(:article) { create(:article, :with_bureau, :with_committee, :published) }

      let(:query) do
        <<~QUERY
          {
            articles(first: 5){
              nodes{
                bureaus{
                  name
                }
                committees{
                  name
                }
              }
            }
          }
        QUERY
      end

      let(:expected_data) do
        {
          nodes: [{
            bureaus: [{ name: article.bureaus.first.name }],
            committees: [{ name: article.committees.first.name }]
          }]
        }
      end

      it 'returns expected data' do
        request
        expect(response_data).to eq expected_data
      end
    end
  end
end
