require 'rails_helper'

RSpec.describe EventCarts::CartsController do
  describe '#show' do
    context 'with invalid uuid' do
      it 'returns http not_found' do
        get '/event_carts/carts/0/'
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'with disabled uuid' do
      let!(:cart) { create(:'event_carts/cart', :disabled) }

      it 'returns http not_found' do
        get event_carts_cart_path(cart.unique_code)
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe '#edit' do
    context 'with invalid uuid' do
      it 'returns http not_found' do
        get '/event_carts/carts/0/edit'
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'with disabled uuid' do
      let!(:cart) { create(:'event_carts/cart', :disabled) }

      it 'returns http not_found' do
        get edit_event_carts_cart_path(cart.unique_code)
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe '#destroy' do
    subject(:request) { delete event_carts_cart_path(cart.unique_code) }

    let!(:cart) { create(:'event_carts/cart') }

    it 'returns http found and disables cart' do
      expect { request }.not_to change(EventCarts::Cart, :count)
      expect(cart.reload.disabled).to be true
      expect(cart.reload.disabled_at).not_to be_nil
      expect(response).to have_http_status(:found)
    end
  end
end
