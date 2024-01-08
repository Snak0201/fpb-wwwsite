require 'rails_helper'

RSpec.describe "Tools", type: :request do
  describe "GET /characters_count" do
    it "returns http success" do
      get "/tools/characters_count"
      expect(response).to have_http_status(:success)
    end
  end

end
