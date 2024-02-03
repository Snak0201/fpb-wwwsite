require 'rails_helper'

RSpec.describe ArticlesController do
  describe 'GET /articles/' do
    context 'with published article' do
      let!(:article) { create(:article, :published) }

      it 'has the article' do
        get '/articles/'
        expect(response).to have_http_status(:success)
        expect(response.body).to include article.title
      end
    end

    context 'without published article' do
      let!(:article) { create(:article) }

      it 'does not have the article' do
        get '/articles/'
        expect(response).to have_http_status(:success)
        expect(response.body).not_to include article.title
      end
    end
  end

  describe 'GET /articles/:article_id' do
    context 'when article is published' do
      let(:article) { create(:article, :published) }

      it 'returns http success' do
        get "/articles/#{article.id}"
        expect(response).to have_http_status(:success)
      end
    end

    context 'when article is not published' do
      let(:article) { create(:article) }

      it 'raises record not found error' do
        expect { get "/articles/#{article.id}" }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
