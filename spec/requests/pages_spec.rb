require 'rails_helper'

RSpec.describe 'Pages' do
  describe 'GET /' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /invalid' do
    it 'raises routing error' do
      expect { get '/invalid' }.to raise_error(ActionController::RoutingError)
    end
  end
end
