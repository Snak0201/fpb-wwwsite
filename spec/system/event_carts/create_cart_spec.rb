require 'rails_helper'

RSpec.describe 'event_cart create cart' do
  context 'with valid input' do
    it 'creates cart' do
      visit event_carts_root_path
      fill_in 'イベント名', with: 'event'
      fill_in '開催日', with: '002025-01-02'
      fill_in '会場', with: 'hall 201'
      click_on 'カートの作成'

      expect(page).to have_content '登録しました'
      expect(page).to have_content '2025年01月02日(木)'
      expect(page).to have_content 'hall 201'
      expect(page).to have_content 'event'
    end
  end

  context 'with invalid input' do
    it 'creates cart' do
      visit event_carts_root_path
      click_on 'カートの作成'

      expect(page).to have_content 'イベント名を入力してください'
      expect(page).to have_content '開催日を入力してください'
      expect(page).to have_content '会場を入力してください'
    end
  end
end
