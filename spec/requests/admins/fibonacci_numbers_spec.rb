require 'rails_helper'

RSpec.describe 'Admins::FibonacciNumbers' do
  describe 'GET /show' do
    it 'returns http success' do
      get '/admins/fibonacci_numbers/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/admins/fibonacci_numbers/create'
      expect(response).to have_http_status(:success)
    end
  end
end