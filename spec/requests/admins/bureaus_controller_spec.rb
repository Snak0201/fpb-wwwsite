require 'rails_helper'

RSpec.describe Admins::BureausController do
  let!(:bureau) { create(:bureau) }

  describe 'GET /' do
    it 'returns http success' do
      get admin_bureaus_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /:bureau_slug/edit' do
    it 'returns http success' do
      get edit_admin_bureau_path(bureau)
      expect(response).to have_http_status(:success)
    end
  end
end
