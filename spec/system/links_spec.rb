require 'rails_helper'

RSpec.describe 'links page' do
  let(:admin) { create(:admin) }

  context 'when log in as admin' do
    before do
      visit new_admin_session_path
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_on 'Log in'
    end

    it 'has link to admin' do
      visit links_path
      expect(page).to have_content '記事一覧'
      expect(page).to have_link '文字数カウンター', href: tools_character_counter_path
      expect(page).to have_link 'ほしのなか政府について', href: about_path
      expect(page).to have_link '管理画面', href: admin_index_path
    end
  end

  context 'when not login' do
    it 'does not have link to admin' do
      visit links_path
      expect(page).to have_content '記事一覧'
      expect(page).to have_link '文字数カウンター', href: tools_character_counter_path
      expect(page).to have_link 'ほしのなか政府について', href: about_path
      expect(page).to have_no_link '管理画面', href: admin_index_path
    end
  end
end
