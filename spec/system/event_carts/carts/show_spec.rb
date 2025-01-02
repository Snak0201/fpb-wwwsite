require 'rails_helper'

RSpec.describe 'event_cart show cart' do
  context 'with atlas' do
    let!(:cart) { create(:'event_carts/cart', :with_atlas) }

    it 'exists atlas link' do
      visit event_carts_cart_path(cart.unique_code)
      expect(page).to have_link '会場地図を開く', href: cart.atlas
    end
  end

  context 'without atlas' do
    let!(:cart) { create(:'event_carts/cart') }

    it 'does not exist atlas link' do
      visit event_carts_cart_path(cart.unique_code)
      expect(page).to have_no_link '会場地図を開く', href: cart.atlas
    end
  end
end
