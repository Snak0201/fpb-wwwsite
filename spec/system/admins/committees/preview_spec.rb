require 'rails_helper'

RSpec.describe 'preview an article' do
  let(:admin) { create(:admin) }
  let(:bureau){create(:bureau)}
  let(:name) { "更新後" }
  let(:slug) { "updated" }

  before do
    admin_log_in admin
  end

  describe "create" do
    context "with no bureaus" do
      it "has 独立委員会" do
        visit new_admin_article_path
        fill_in '名称', with: title
        fill_in 'Slug', with: slug
        click_on '表示確認'
        expect(page).to have_content title
        expect(page).to have_content "独立委員会"
      end
    end
  end
end
