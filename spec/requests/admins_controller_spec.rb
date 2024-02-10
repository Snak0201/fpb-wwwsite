require 'rails_helper'

RSpec.describe AdminsController do
  let(:admin) { create(:admin) }

  describe 'GET /' do
    context 'without login' do
      it 'returns http found' do
        get '/admin/'
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to new_admin_session_path
      end
    end

    context 'with login' do
      it 'returns http success' do
        sign_in admin
        get '/admin/'
        expect(response).to have_http_status(:success)
      end
    end
  end
end
