require 'rails_helper'

RSpec.describe 'event_cart edit cart' do
  let!(:cart) { create(:'event_carts/cart') }
  let(:name) { 'event' }
  let(:held_at) { '002025-01-02' }
  let(:place) { 'hall 201' }
  let(:atlas) { 'https://example.com' }

  context 'with valid input' do
    it 'updates cart' do
      visit edit_event_carts_cart_path(cart.unique_code)
      fill_in 'イベント名', with: name
      fill_in '開催日', with: held_at
      fill_in '会場', with: place
      fill_in '会場地図', with: atlas
      click_on '保存'

      expect(page).to have_content '保存しました'
      expect(page).to have_content '2025年01月02日(木)'
      expect(page).to have_content 'hall 201'
      expect(page).to have_content 'event'
      expect(page).to have_link '会場地図を開く', href: atlas
    end
  end

  context 'with same input' do
    it 'updates cart' do
      visit edit_event_carts_cart_path(cart.unique_code)
      click_on '保存'

      expect(page).to have_content '保存しました'
    end
  end

  context 'with invalid atlas' do
    let(:atlas) { 'invalid-atlas.com' }

    it 'does not create cart' do
      visit edit_event_carts_cart_path(cart.unique_code)
      fill_in 'イベント名', with: name
      fill_in '開催日', with: held_at
      fill_in '会場', with: place
      fill_in '会場地図', with: atlas
      click_on '保存'

      expect(page).to have_content 'カートに戻る'
      expect(page).to have_content '会場地図は不正な値です'
    end
  end
end
