require 'rails_helper'

RSpec.describe EventCart::CartsController do
  describe 'GET /event_cart/carts/:uuid/' do
    context 'with invalid uuid' do
      it 'returns http not_found' do
        get '/event_cart/carts/0/'
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'with disabled uuid' do
      let!(:cart) { create(:'event_cart/cart', :disabled) }

      it 'returns http not_found' do
        get event_cart_cart_path(cart.unique_code)
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET /event_cart/carts/:uuid/edit' do
    context 'with invalid uuid' do
      it 'returns http not_found' do
        get '/event_cart/carts/0/edit'
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'with disabled uuid' do
      let!(:cart) { create(:'event_cart/cart', :disabled) }

      it 'returns http not_found' do
        get edit_event_cart_cart_path(cart.unique_code)
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
