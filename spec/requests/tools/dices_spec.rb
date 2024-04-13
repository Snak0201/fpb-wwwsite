require 'rails_helper'

RSpec.describe 'Tools::Dices' do
  describe 'GET /show' do
    it 'returns http success' do
      get '/tools/dices/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/tools/dices/create'
      expect(response).to have_http_status(:success)
    end
  end
end
