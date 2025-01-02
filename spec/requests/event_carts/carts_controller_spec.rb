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
end
