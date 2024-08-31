require 'rails_helper'

RSpec.describe Admins::CommitteesController do
  describe 'GET /' do
    it 'returns http success' do
      get admin_committees_path
      expect(response).to have_http_status(:success)
    end
  end
end
