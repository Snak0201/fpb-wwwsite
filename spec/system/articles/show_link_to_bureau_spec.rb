require 'rails_helper'

RSpec.describe 'show article page' do
  let(:article) { create(:article, :published) }

  before do
    create(:bureau_article, article:)
  end

  it 'has link to bureau path' do
    bureau = Bureau.first

    visit article_path(Article.first)
    within('#bureaus') do
      click_on bureau.name
      expect(page).to have_current_path bureau_path(bureau)
    end
  end
end
