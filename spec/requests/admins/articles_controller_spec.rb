require 'rails_helper'

RSpec.describe Admins::ArticlesController do
  let(:article) { create(:article) }

  context 'when not log in' do
    describe 'GET /admin/articles/:article_id' do
      it 'returns http found' do
        get admin_article_path(article)
        expect(response).to have_http_status(:found)
      end
    end

    describe 'GET /admin/articles/new' do
      it 'returns http found' do
        get new_admin_article_path
        expect(response).to have_http_status(:found)
      end
    end

    describe 'GET /admin/articles/:article_id/edit' do
      it 'returns http found' do
        get edit_admin_article_path(article)
        expect(response).to have_http_status(:found)
      end
    end
  end

  context 'when log in as admin' do
    let(:admin) { create(:admin) }

    before do
      sign_in admin
    end

    describe 'GET admin_articles_path' do
      let(:title) { 'PUBLISHED' }
      let!(:article) { create(:article) }
      let!(:published_article) { create(:article, :published, title:) }

      it 'shows all (include unpublished) articles' do
        get admin_articles_path
        expect(response).to have_http_status(:success)
        expect(response.body).to include article.title
        expect(response.body).to include published_article.title
      end
    end

    describe 'POST admin_articles_path' do
      let(:title) { 'TITLE' }
      let(:content) { 'CONTENT' }
      let(:number) { 0 }

      context 'with right content' do
        it 'creates article' do
          post admin_articles_path(article: { title:, content:, number: })
          expect(response).to have_http_status(:found)
          expect(Article.find_by(title:)).to be_truthy
        end
      end
    end

    describe 'GET /admin/articles/:article_id' do
      context 'with existing article' do
        it 'returns http success' do
          get admin_article_path(article)
          expect(response).to have_http_status(:success)
        end
      end

      context 'without existing article' do
        it 'raises record not found' do
          expect { get "/admin/articles/#{article.id + 1}" }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end

    describe 'PATCH admin_article_path' do
      let(:title) { 'TITLE' }
      let(:content) { 'CONTENT' }
      let(:number) { 0 }

      it 'updates the article' do
        patch admin_article_path(article, article: { title:, content:, number: })
        expect(response).to have_http_status(:found)
        article.reload
        expect(article.title).to eq title
        expect(article.content).to eq content
        expect(article.number).to eq number
      end
    end

    describe 'DELETE /admin/articles/:article_id' do
      it 'destroys the article' do
        delete admin_article_path(article)
        expect(response).to have_http_status(:found)
        expect { Article.find(article.id) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    describe 'GET /admin/articles/new' do
      it 'returns http success' do
        get new_admin_article_path
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET /admin/articles/:article_id/edit' do
      it 'returns http success' do
        get edit_admin_article_path(article)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'PATCH /admin/articles/:article_id/toggle_published' do
      it 'toggles published' do
        patch toggle_published_admin_article_path(article)
        expect(response).to have_http_status(:found)
        expect(article.reload.published_at).to be_truthy
        patch toggle_published_admin_article_path(article)
        expect(response).to have_http_status(:found)
        expect(article.reload.published_at).to be_falsey
      end
    end
  end
end
