require 'rails_helper'

RSpec.describe 'article title' do
  let(:article) { create(:article, :published) }

  it 'is correct' do
    visit article_path(article)
    expect(page).to have_title "#{article.title} | ほしのなか政府"
  end
end
