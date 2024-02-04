require 'rails_helper'

RSpec.describe 'pagination of articles as admin' do
  context 'with 51 published articles' do
    let(:oldest_article){Article.order(created_at: :asc).first}
    let(:newest_article){Article.order(created_at: :desc).first}

    before do
      create_list(:article, 51-Article.published.count, :published)
    end

    it 'separates 3 pages' do
      visit articles_path
      expect(page).to have_selector '.article_title', count: 25
      expect(page).to have_content newest_article.title
      click_on '2'
      expect(page).to have_selector '.article_title', count: 25
      click_on 'Next'
      expect(page).to have_selector '.article_title', count: 1
      expect(page).to have_content oldest_article.title
    end
  end

  context 'with 50 published articles and 50 unpublished articles' do
    before do
      create_list(:article, 50-Article.published.count, :published)
      create_list(:article, 50-Article.published.count)
    end

    it 'separates 2 pages' do
      visit articles_path
      within('.pagination') do
        expect(page).to have_content '1'
        expect(page).to have_content '2'
        expect(page).not_to have_content '3'
      end
    end
  end
end
