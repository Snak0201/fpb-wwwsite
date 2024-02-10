require 'rails_helper'

RSpec.describe Admins::AnnouncementsController do
  context 'when not log in' do
    describe 'GET /new' do
      it 'returns http found' do
        get '/admin/announcement/new'
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to new_admin_session_path
      end
    end

    describe 'POST /preview' do
      it 'returns http found' do
        post '/admin/announcement/preview'
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end

  context 'when log in' do
    let(:admin) { create(:admin) }

    before do
      sign_in admin
    end

    describe 'GET /new' do
      it 'returns http success' do
        get '/admin/announcement/new'
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST /preview' do
      it 'returns http success' do
        post '/admin/announcement/preview'
        expect(response).to have_http_status(:success)
      end
    end
  end
end
