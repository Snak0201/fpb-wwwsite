require 'rails_helper'

RSpec.describe 'links page' do
  let(:admin) { create(:admin) }

  context 'with log in as admin' do
    before do
      visit new_admin_session_path
      fill_in 'Eメール', with: admin.email
      fill_in 'パスワード', with: admin.password
      click_on 'Log in'
    end

    it 'has link to admin' do
      visit links_path
      expect(page).to have_link '管理画面', href: admin_index_path
    end
  end

  context 'without log in' do
    it 'does not have link to admin' do
      visit links_path
      expect(page).to have_no_link '管理画面', href: admin_index_path
    end
  end
end
