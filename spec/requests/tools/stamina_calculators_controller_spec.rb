require 'rails_helper'

RSpec.describe Tools::StaminaCalculatorsController do
  describe 'GET /' do
    it 'returns http success' do
      get '/tools/stamina_calculator'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /stamina' do
    it 'returns http success' do
      get '/tools/stamina_calculator/stamina'
      expect(response).to have_http_status(:success)
    end
  end
end
