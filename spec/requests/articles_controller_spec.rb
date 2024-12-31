require 'rails_helper'

RSpec.describe ArticlesController do
  describe 'GET /articles/' do
    context 'with published article' do
      let!(:article) { create(:article, :published) }

      it 'has the article' do
        get articles_path
        expect(response.body).to include article.title
      end
    end

    context 'without published article' do
      let!(:article) { create(:article) }

      it 'does not have the article' do
        get articles_path
        expect(response.body).not_to include article.title
      end
    end
  end

  describe 'GET /articles/:article_id' do
    context 'when article is not published' do
      let(:article) { create(:article) }

      it 'returns not found' do
        get article_path(article)
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
