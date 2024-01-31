require 'rails_helper'

RSpec.describe 'Admins::Articles' do
  # describe "GET /show" do
  #   it "returns http success" do
  #     get "/admins/articles/show"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe 'GET /new' do
    it 'returns http success' do
      get '/admins/articles/new'
      expect(response).to have_http_status(:success)
    end
  end

  # describe 'GET /edit' do
  #   it 'returns http success' do
  #     get '/admins/articles/edit'
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
