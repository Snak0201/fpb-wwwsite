require 'rails_helper'

RSpec.describe Admins::AnnouncementsController do
  before do
    # NOTE: レコードがないとeditでエラーが出る
    create(:admins_announcement)
  end

  context 'when not log in' do
    describe 'GET /edit' do
      it 'returns http found' do
        get '/admin/announcement/edit'
        expect(response).to have_http_status(:found)
      end
    end

    # describe 'GET /preview' do
    #   it 'returns http found' do
    #     get '/admin/announcement/preview'
    #     expect(response).to have_http_status(:found)
    #   end
    # end
  end

  context 'when log in' do
    let(:admin) { create(:admin) }

    before do
      sign_in admin
    end

    describe 'GET /edit' do
      it 'returns http success' do
        get '/admin/announcement/edit'
        expect(response).to have_http_status(:success)
      end
    end

    # describe 'GET /preview' do
    #   it 'returns http success' do
    #     get '/admin/announcement/preview'
    #     expect(response).to have_http_status(:success)
    #   end
    # end
  end
end
