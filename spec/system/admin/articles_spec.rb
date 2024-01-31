require 'rails_helper'

RSpec.describe 'articles on admin page' do
  let(:admin) { create(:admin) }
  let(:article) { create(:article) }

  before do
    admin_log_in admin
  end

  describe 'delete article' do
    it do
      visit admin_article_path(article)
      click_on '記事を削除する'
      expect(page).to have_content '記事が削除されました'
      expect(page).to have_no_content 'Test Article'
    end
  end
end
