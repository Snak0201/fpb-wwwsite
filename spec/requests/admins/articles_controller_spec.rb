require 'rails_helper'

RSpec.describe Admins::ArticlesController do
  context 'when not log in' do
    # describe "GET /show" do
    #   it "returns http success" do
    #     get "/admin/articles/show"
    #     expect(response).to have_http_status(:success)
    #   end
    # end

    describe 'GET /new' do
      it 'returns http found' do
        get '/admin/articles/new'
        expect(response).to have_http_status(:found)
      end
    end

    # describe 'GET /edit' do
    #   it 'returns http success' do
    #     get '/admin/articles/edit'
    #     expect(response).to have_http_status(:success)
    #   end
    # end
  end

  context 'when log in as admin' do
    let(:admin) { create(:admin) }

    before do
      sign_in admin
    end

    # describe "GET /show" do
    #   it "returns http success" do
    #     get "/admin/articles/show"
    #     expect(response).to have_http_status(:success)
    #   end
    # end

    describe 'GET /new' do
      it 'returns http success' do
        get '/admin/articles/new'
        expect(response).to have_http_status(:success)
      end
    end

    # describe 'GET /edit' do
    #   it 'returns http success' do
    #     get '/admin/articles/edit'
    #     expect(response).to have_http_status(:success)
    #   end
    # end
  end
end
