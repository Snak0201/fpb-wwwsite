require 'rails_helper'

RSpec.describe 'show article as admin' do
  let(:admin) { create(:admin) }
  let(:unpublished_article) { create(:article) }
  let(:published_article) { create(:article, :published) }

  before do
    admin_log_in admin
  end

  describe 'display article' do
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
end
