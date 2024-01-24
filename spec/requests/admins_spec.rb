require 'rails_helper'

RSpec.describe 'Admin' do
  describe 'GET /' do
    it 'returns http found' do
      get '/admin/'
      expect(response).to have_http_status(:found)
    end
  end
end
