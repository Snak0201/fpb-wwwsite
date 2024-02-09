require 'rails_helper'

RSpec.describe 'Admins::Announcements' do
  describe 'GET /edit' do
    it 'returns http success' do
      get '/admins/announcements/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /preview' do
    it 'returns http success' do
      get '/admins/announcements/preview'
      expect(response).to have_http_status(:success)
    end
  end
end
