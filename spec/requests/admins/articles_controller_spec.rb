require 'rails_helper'

RSpec.describe Admins::ArticlesController do
  let(:article) { create(:article) }

  context 'when not log in' do
    describe 'GET /admin/articles/:article_id' do
      it 'returns http found' do
        get "/admin/articles/#{article.id}"
        expect(response).to have_http_status(:found)
      end
    end

    describe 'GET /new' do
      it 'returns http found' do
        get '/admin/articles/new'
        expect(response).to have_http_status(:found)
      end
    end

    describe 'GET /edit' do
      it 'returns http found' do
        get "/admin/articles/#{article.id}/edit"
        expect(response).to have_http_status(:found)
      end
    end
  end

  context 'when log in as admin' do
    let(:admin) { create(:admin) }

    before do
      sign_in admin
    end

    describe 'GET /admin/articles/:article_id' do
      context 'with existing article' do
        it 'returns http success' do
          get "/admin/articles/#{article.id}"
          expect(response).to have_http_status(:success)
        end
      end

      context 'without existing article' do
        it 'raises record not found' do
          expect { get "/admin/articles/#{article.id + 1}" }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end

    describe 'GET /admin/articles/new' do
      it 'returns http success' do
        get '/admin/articles/new'
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET /admin/articles/:article_id/edit' do
      it 'returns http success' do
        get "/admin/articles/#{article.id}/edit"
        expect(response).to have_http_status(:success)
      end
    end

    describe 'DELETE /admin/articles/:article_id' do
      it 'returns http found' do
        delete "/admin/articles/#{article.id}/"
        expect(response).to have_http_status(:found)
      end
    end
  end
end