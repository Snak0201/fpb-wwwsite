require 'rails_helper'

RSpec.describe 'Article' do
  describe 'POST /graphql' do
    subject(:request) { post '/graphql', params: { query: } }

    let(:response_data) { JSON.parse(response.body, symbolize_names: true).dig(:data, :articles) }
    let(:response_nodes) { response_data[:nodes] }

    before do
      create_list(:article, 7, :published)
      create_list(:article, 3)
    end

    context 'when requests articles query' do
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
  end
end
