require 'rails_helper'

RSpec.describe 'event_cart destroy cart' do
  let!(:cart) { create(:'event_carts/cart') }

  it 'disables cart' do
    visit edit_event_carts_cart_path(cart.unique_code)
    click_on '情報の削除'

    expect(page).to have_content 'カートを削除しました'
  end
end
