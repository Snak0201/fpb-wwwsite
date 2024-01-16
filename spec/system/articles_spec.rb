require 'rails_helper'
require 'i18n'

RSpec.describe 'show_article' do
  let(:article) { create(:article) }

  it 'has right contents' do
    visit article_path(article.id)
    within('#title') { expect(page).to have_content article.title }
    within('#content') { expect(page).to have_content article.content }
    within('#updated_at') { expect(page).to have_content I18n.l(article.updated_at) }
    # within('#published_at'){expect(page).to have_content article.published_at}
  end
end
