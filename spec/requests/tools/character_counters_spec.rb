require 'rails_helper'

RSpec.describe "Tools::CharacterCounters", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/tools/character_counters/show"
      expect(response).to have_http_status(:success)
    end
  end

end
