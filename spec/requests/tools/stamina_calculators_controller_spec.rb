require 'rails_helper'

RSpec.describe Tools::StaminaCalculatorsController do
  describe 'GET /' do
    it 'returns http success' do
      get '/tools/stamina_calculator'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /stamina_from_time' do
    it 'returns http success' do
      get '/tools/stamina_calculator/stamina_from_time'
      expect(response).to have_http_status(:success)
    end
  end
end
