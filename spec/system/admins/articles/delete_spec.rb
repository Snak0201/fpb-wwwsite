require 'rails_helper'

RSpec.describe 'delete an article' do
  let(:admin) { create(:admin) }
  let(:article) { create(:article) }

  before do
    admin_log_in admin
  end

  it 'is success to delete an article' do
    visit admin_article_path(article)
    click_on '記事を削除する'
    expect(page).to have_current_path admin_articles_path, ignore_query: true
    expect(page).to have_content '記事が削除されました'
    expect(page).to have_no_content article.title
  end
end
