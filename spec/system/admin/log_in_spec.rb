require 'rails_helper'

RSpec.describe 'log in to admin' do
  let(:admin) { create(:admin) }

  context 'with correct info' do
    it 'can log in' do
      visit new_admin_session_path
      fill_in 'Eメール', with: admin.email
      fill_in 'パスワード', with: admin.password
      click_on 'Log in'
      expect(page).to have_content 'ログインしました'
      expect(page).to have_current_path root_path, ignore_query: true
    end
  end

  context 'with invalid password' do
    it 'cannot log in' do
      visit new_admin_session_path
      fill_in 'Eメール', with: admin.email
      fill_in 'パスワード', with: "#{admin.password}#{admin.password}"
      click_on 'Log in'
      expect(page).to have_content 'Eメールまたはパスワードが違います。'
      expect(page).to have_current_path new_admin_session_path, ignore_query: true
    end
  end

  context 'when admin has already log in' do
    before do
      visit new_admin_session_path
      fill_in 'Eメール', with: admin.email
      fill_in 'パスワード', with: admin.password
      click_on 'Log in'
    end

    it 'redirect to root path' do
      visit new_admin_session_path
      expect(page).to have_content 'すでにログインしています'
      expect(page).to have_current_path root_path, ignore_query: true
    end
  end
end
