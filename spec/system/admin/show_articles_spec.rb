require 'rails_helper'

RSpec.describe 'show articles on admin page' do
  let(:admin) { create(:admin) }
  let(:article) { create(:article) }
  let(:published_article) { create(:article, :published) }

  before do
    admin_log_in admin
  end

  describe 'show article' do
    context 'when the article is not published' do
      it 'has right message about published_at' do
        visit admin_article_path(article)
        within('#published_at') { expect(page).to have_content '公開されていません' }
      end
    end
  end
end
