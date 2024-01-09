require 'rails_helper'

RSpec.describe "Tools::CharacterCounters", type: :request do
  describe "GET /" do
    it "returns http success" do
      get "/tools/character_counter/"
      expect(response).to have_http_status(:success)
    end
  end

end
