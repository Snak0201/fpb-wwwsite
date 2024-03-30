require 'rails_helper'

RSpec.describe 'show article in admin page' do
  let(:admin) { create(:admin) }
  let(:unpublished_article) { create(:article) }
  let(:published_article) { create(:article, :published) }

  before do
    admin_log_in admin
  end

  describe '#published_at' do
    context 'when the article is not published' do
      it 'has right message about published_at' do
        visit admin_article_path(unpublished_article)
        within('#published_at') { expect(page).to have_content '公開されていません' }
      end
    end

    context 'when the article is published' do
      it 'has published_at' do
        visit admin_article_path(published_article)
        within('#published_at') { expect(page).to have_content I18n.l(published_article.published_at) }
      end
    end
  end

  describe 'restore link' do
    context 'when the article does not have versions' do
      it 'do not exist' do
        visit admin_article_path(published_article)

        expect(page).to have_no_link '記事を復元する', href: restore_previous_version_admin_article_path(published_article)
      end
    end

    context 'when the article has versions' do
      before do
        published_article.update(title: '更新後のタイトル', content: '更新されたコンテンツ')
      end

      it 'exists' do
        visit admin_article_path(published_article)

        expect(page).to have_link '記事を復元する', href: restore_previous_version_admin_article_path(published_article)
      end
    end
  end
end
