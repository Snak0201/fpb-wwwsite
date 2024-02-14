require 'rails_helper'

RSpec.describe Tools::StaminaCalculatorsController do
  describe 'GET /show' do
    it 'returns http success' do
      get '/tools/stamina_calculator'
      expect(response).to have_http_status(:success)
    end
  end
end
