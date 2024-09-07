require 'rails_helper'

RSpec.describe 'show article page' do
  let(:article) { create(:article, :published) }

  before do
    create(:bureau_article, article:)
    create(:committee_article_tag, article:)
  end

  describe '#bureaus' do
    it 'has link to bureau path' do
      bureau = Bureau.first

      visit article_path(article)
      within('#bureaus') do
        click_on bureau.name
        expect(page).to have_current_path bureau_path(bureau)
      end
    end
  end

  describe '#committees' do
    it 'has committees name' do
      committee = Committee.first

      visit article_path(article)
      within('#committees') { expect(page).to have_content committee.name }
    end
  end
end
