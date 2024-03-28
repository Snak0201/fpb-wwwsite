require 'rails_helper'

RSpec.describe Admins::FibonacciNumbersController do
  describe 'GET /fibonacci' do
    let(:endpoint) { 'https://fpbwwwapi.pythonanywhere.com/api/fibonacci/v1/number?n' }
    let(:fib_err_response) do
      {
        value: nil,
        errors: {
          n: ['有効な整数を入力してください。']
        }
      }.to_json
    end

    # NOTE: テストでAPIにリクエストする部分がある
    before do
      stub_request(:get, endpoint).to_return(status: 400, body: fib_err_response, headers: {})
    end

    it 'returns http success' do
      get admin_fibonacci_number_path
      expect(response).to have_http_status(:success)
    end
  end
end
