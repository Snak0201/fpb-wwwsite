require 'rails_helper'

RSpec.describe PagesController do
  describe 'GET /' do
    context 'with 6 articles' do
      let(:newest_articles) { Article.where.not(published_at: nil).order(published_at: :desc).limit(5) }

      before do
        create_list(:article, 6, :published)
      end

      it 'shows the newest 5 articles' do
        get '/'
        expect(response).to have_http_status(:success)
        newest_articles.each do |article|
          expect(response.body).to include article.title
        end
      end
    end

    context 'with 6 published articles and newer 5 unpublished articles' do
      let(:newest_articles) { Article.where.not(published_at: nil).order(published_at: :desc).limit(5) }
      let(:invisible_articles) { Article.where(published_at: nil) }

      before do
        create_list(:article, 6, :published)
        create_list(:article, 5)
      end

      it 'shows the newest 5 published articles' do
        get '/'
        expect(response).to have_http_status(:success)
        newest_articles.each do |article|
          expect(response.body).to include article.title
        end
        invisible_articles.each do |article|
          expect(response.body).not_to include article.title
        end
      end
    end
  end

  describe 'GET /about' do
    it 'returns http success' do
      get '/about'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /links' do
    it 'returns http success' do
      get '/links'
      expect(response).to have_http_status(:success)
    end
  end
end
