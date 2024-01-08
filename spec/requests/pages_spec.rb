require 'rails_helper'

RSpec.describe 'Pages' do
  describe 'GET /' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /about' do
    it 'returns http success' do
      get '/about'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /links' do
    it 'returns http success' do
      get '/links'
      expect(response).to have_http_status(:success)
    end
  end
end
