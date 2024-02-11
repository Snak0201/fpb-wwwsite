require 'rails_helper'

RSpec.describe 'create an article' do
  let(:admin) { create(:admin) }
  let(:title) { 'TITLE' }
  let(:content) { 'CONTENT' }
  let(:number) { 1 }

  before do
    admin_log_in admin
    create_list(:bureau, 3)
  end

  context 'with 1 bureau' do
    it 'shows the jurisdiction bureau on admin article show page' do
      visit new_admin_article_path
      fill_in 'タイトル', with: title
      fill_in '内容', with: content
      check Bureau.first.name
      fill_in '分類番号', with: number
      click_on '登録'
      expect(page).to have_content '記事が登録されました'
      click_on title
      within('#bureaus') do
        expect(page).to have_content Bureau.first.name
      end
    end
  end

  context 'with 3 bureau' do
    it 'shows the jurisdiction bureau on admin article show page' do
      visit new_admin_article_path
      fill_in 'タイトル', with: title
      fill_in '内容', with: content
      check Bureau.first.name
      check Bureau.second.name
      check Bureau.last.name
      fill_in '分類番号', with: number
      click_on '登録'
      expect(page).to have_content '記事が登録されました'
      click_on title
      within('#bureaus') do
        expect(page).to have_content Bureau.first.name
        expect(page).to have_content Bureau.second.name
        expect(page).to have_content Bureau.last.name
      end
    end
  end
end
