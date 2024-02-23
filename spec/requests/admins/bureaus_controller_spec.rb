require 'rails_helper'

RSpec.describe Admins::BureausController do
  let!(:bureau) { create(:bureau) }

  describe 'GET /' do
    it 'returns http success' do
      get '/admin/bureaus'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get "/admin/bureaus/#{bureau.slug}/edit"
      expect(response).to have_http_status(:success)
    end
  end

  # describe 'GET /update' do
  #   it 'returns http success' do
  #     get '/admins/bureaus/update'
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
