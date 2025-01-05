require 'rails_helper'

RSpec.describe EventCarts::MarksController do
  describe '#new' do
    context 'with invalid unique_code' do
      it 'returns http not_found' do
        get new_event_carts_cart_mark_path(0)
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'with disabled unique_code' do
      let!(:disabled_cart) { create(:'event_carts/cart', :disabled) }

      it 'returns http not_found' do
        get new_event_carts_cart_mark_path(disabled_cart)
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe '#edit' do
    let!(:cart) { create(:'event_carts/cart') }

    context 'with invalid unique_code' do
      it 'returns http not_found' do
        get edit_event_carts_cart_mark_path(cart, 0)
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'with other cart unique_code' do
      let!(:mark) { create(:'event_carts/mark') }

      it 'returns http not_found' do
        get edit_event_carts_cart_mark_path(cart, mark)
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'with disable cart unique_code' do
      let!(:disabled_cart) { create(:'event_carts/cart', :disabled) }
      let!(:mark) { create(:'event_carts/mark', cart: disabled_cart) }

      it 'returns http not_found' do
        get edit_event_carts_cart_mark_path(disabled_cart, mark)
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
