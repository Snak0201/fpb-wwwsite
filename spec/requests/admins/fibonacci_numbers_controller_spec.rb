require 'rails_helper'

RSpec.describe Admins::FibonacciNumbersController do
  describe 'GET /fibonacci' do
    it 'returns http success' do
      get admin_fibonacci_number_path
      expect(response).to have_http_status(:success)
    end
  end
end
