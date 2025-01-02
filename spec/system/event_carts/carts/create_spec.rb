require 'rails_helper'

RSpec.describe 'event_cart create cart' do
  let(:name) { 'event' }
  let(:held_at) { '002025-01-02' }
  let(:place) { 'hall 201' }
  let(:atlas) { 'https://example.com' }

  context 'with valid input' do
    it 'creates cart' do
      visit event_carts_root_path
      fill_in 'イベント名', with: name
      fill_in '開催日', with: held_at
      fill_in '会場', with: place
      fill_in '会場地図', with: atlas
      click_on 'カートの作成'

      expect(page).to have_content '登録しました'
      expect(page).to have_content '2025年01月02日(木)'
      expect(page).to have_content 'hall 201'
      expect(page).to have_content 'event'
      expect(page).to have_link '会場地図を開く', href: atlas
    end
  end

  context 'without input' do
    it 'does not create cart' do
      visit event_carts_root_path
      click_on 'カートの作成'

      expect(page).to have_content 'EventCart'
      expect(page).to have_content 'イベント名を入力してください'
      expect(page).to have_content '開催日を入力してください'
      expect(page).to have_content '会場を入力してください'
    end
  end

  context 'with invalid atlas' do
    let(:atlas) { 'invalid-atlas.com' }

    it 'does not create cart' do
      visit event_carts_root_path
      fill_in 'イベント名', with: name
      fill_in '開催日', with: held_at
      fill_in '会場', with: place
      fill_in '会場地図', with: atlas
      click_on 'カートの作成'

      expect(page).to have_content 'EventCart'
      expect(page).to have_content '会場地図は不正な値です'
    end
  end
end
