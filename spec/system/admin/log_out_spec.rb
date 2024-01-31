require 'rails_helper'

RSpec.describe 'log out of admin' do
  let(:admin) { create(:admin) }

  before do
    admin_log_in admin
  end

  context 'when click on log out link' do
    it 'can log out' do
      visit admin_index_path
      click_on 'ログアウト'
      expect(page).to have_content 'ログアウトしました'
      expect(page).to have_current_path root_path, ignore_query: true
    end
  end
end
