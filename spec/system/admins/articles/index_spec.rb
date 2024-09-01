require 'rails_helper'

RSpec.describe 'articles index in admin page' do
  let(:admin) { create(:admin) }
  let(:unpublished_article) { create(:article) }
  let(:published_article) { create(:article, :published) }

  before do
    admin_log_in admin
    create_list(:bureau, 2)
    create(:bureau_article, bureau: Bureau.first, article: unpublished_article)
    create(:bureau_article, bureau: Bureau.first, article: published_article)
    create(:bureau_article, bureau: Bureau.second, article: published_article)
  end

  it 'has all articles and correct information' do
    visit admin_articles_path
    within "#article_#{unpublished_article.id}" do
      expect(page).to have_content unpublished_article.id
      expect(page).to have_content unpublished_article.title
      unpublished_article.bureaus.each do |bureau|
        expect(page).to have_content bureau.name
      end
      expect(page).to have_content '非公開'
      expect(page).to have_content '公開されていません'
      expect(page).to have_content I18n.l(unpublished_article.updated_at, format: :short)
    end
    within "#article_#{published_article.id}" do
      expect(page).to have_content published_article.id
      expect(page).to have_content published_article.title
      published_article.bureaus.each do |bureau|
        expect(page).to have_content bureau.name
      end
      expect(page).to have_content '公開'
      expect(page).to have_content I18n.l(published_article.published_at, format: :short)
      expect(page).to have_content I18n.l(published_article.updated_at, format: :short)
    end
  end
end
