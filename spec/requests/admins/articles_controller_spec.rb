require 'rails_helper'

RSpec.describe Admins::ArticlesController do
  let(:article) { create(:article) }

  context 'when not log in' do
    describe 'GET /admin/articles/:article_id' do
      it 'returns http found' do
        get admin_article_path(article)
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to new_admin_session_path
      end
    end

    describe 'GET /admin/articles/new' do
      it 'returns http found' do
        get new_admin_article_path
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to new_admin_session_path
      end
    end

    describe 'GET /admin/articles/:article_id/edit' do
      it 'returns http found' do
        get edit_admin_article_path(article)
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to new_admin_session_path
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
      let(:bureau) { create(:bureau) }
      let(:bureau_ids) { '' }
      let(:params) do
        { article: { title:, content:, number:, bureau_ids: } }
      end

      context 'with right content' do
        it 'creates article' do
          post admin_articles_path(params:)
          expect(response).to have_http_status(:found)
          expect(response).to redirect_to admin_articles_path
          expect(Article.find_by(title:)).to be_truthy
        end
      end

      context 'with bureau' do
        let(:bureau_ids) { [bureau.id.to_s] }

        it 'creates article with a bureau' do
          post admin_articles_path(params:)
          expect(response).to have_http_status(:found)
          expect(response).to redirect_to admin_articles_path
          article = Article.find_by(title:)
          expect(article.bureaus).to include bureau
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
      let(:title) { 'UPDATED TITLE' }
      let(:content) { 'UPDATED CONTENT' }
      let(:number) { 0 }
      let(:bureau) { create(:bureau) }
      let(:bureau_ids) { [bureau.id.to_s] }
      let(:params) do
        { article: { title:, content:, number:, bureau_ids: }, commit: }
      end

      context 'with update commit' do
        let(:commit) { '更新' }

        it 'updates the article' do
          patch admin_article_path(article, params:)
          expect(response).to have_http_status(:found)
          expect(response).to redirect_to admin_article_path(article)
          article.reload
          expect(article.title).to eq title
          expect(article.content).to eq content
          expect(article.number).to eq number
          expect(article.bureaus).to include bureau
        end
      end

      context 'with cancel commit' do
        let(:commit) { 'キャンセル' }

        it 'keeps params' do
          patch admin_article_path(article, params:)
          expect(response).to have_http_status(:see_other)
          expect(response.body).to include title
          expect(response.body).to include content
          expect(response.body).to include number.to_s
        end
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

    describe 'POST preview_admin_article_path' do
      let(:params) do
        { article: { title:, content:, number:, bureau_ids: } }
      end

      let(:title) { '更新後' }
      let(:content) { '更新後のコンテンツ' }
      let(:number) { 0 }
      let(:bureau) { create(:bureau) }
      let(:bureau_ids) { [bureau.id.to_s] }

      it do
        post preview_admin_article_path(article, params:)

        expect(response).to have_http_status(:see_other)
        expect(response).to redirect_to preview_admin_article_path
        expect(response.body).to include title
        expect(response.body).to include content
        expect(response.body).to include bureau.name
      end
    end

    describe 'POST restore_previous_version_admin_article_path' do
      let(:title) { '更新後の記事' }
      let(:content) { '更新されたコンテンツ' }

      context 'when post once' do
        it 'restore previous article' do
          previous_title = article.title
          previous_content = article.content
          article.update(title:, content:)

          post restore_previous_version_admin_article_path(article)

          expect(response).to have_http_status(:found)
          expect(response).to redirect_to admin_article_path(article)

          article.reload
          expect(article.title).to eq previous_title
          expect(article.content).to eq previous_content
        end
      end

      context 'when post twice' do
        it 'cancel restore article' do
          article.title
          article.content
          article.update(title:, content:)

          post restore_previous_version_admin_article_path(article)
          post restore_previous_version_admin_article_path(article)

          article.reload
          expect(article.title).to eq title
          expect(article.content).to eq content
        end
      end
    end
  end
end
