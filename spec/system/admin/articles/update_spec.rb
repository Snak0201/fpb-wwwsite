require 'rails_helper'

RSpec.describe 'update an article' do
  let(:admin) { create(:admin) }
  let(:article) { create(:article) }

  before do
    admin_log_in admin
    create_list(:bureau, 3)

    visit edit_admin_article_path(article)
    check Bureau.first.name
    check Bureau.second.name
    click_on '登録'
  end

  context 'when delete all bureaus on the article' do
    it 'shows no bureaus on admin article show page' do
      visit edit_admin_article_path(article)
      uncheck Bureau.first.name
      click_on '登録'
      expect(page).to have_content '記事が更新されました'
      within('#bureaus') do
        expect(page).to have_no_content Bureau.first.name
        expect(page).to have_content Bureau.second.name
        expect(page).to have_no_content Bureau.last.name
      end
    end
  end

  context 'when add a bureau on the article' do
    it 'shows 3 bureaus on admin article show page' do
      visit edit_admin_article_path(article)
      check Bureau.last.name
      click_on '登録'
      expect(page).to have_content '記事が更新されました'
      within('#bureaus') do
        expect(page).to have_content Bureau.first.name
        expect(page).to have_content Bureau.second.name
        expect(page).to have_content Bureau.last.name
      end
    end
  end
end
