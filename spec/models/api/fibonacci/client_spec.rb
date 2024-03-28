require 'rails_helper'
require 'webmock/rspec'

RSpec.describe Api::Fibonacci::Client do
  let(:client) { described_class.new }
  let(:fib_response) do
    {
      value: 55
    }.to_json
  end
  let(:fib_err_response) do
    {
      value: nil,
      errors: {
        n: ['有効な整数を入力してください。']
      }
    }.to_json
  end

  context 'with request valid params' do
    let(:endpoint) { 'https://fpbwwwapi.pythonanywhere.com/api/fibonacci/v1/number?n=10' }

    before do
      stub_request(:get, endpoint).to_return(status: 200, body: fib_response, headers: {})
    end

    it 'responses 200' do
      response = client.get_fibonacci_number(10)
      expect(response[:status]).to eq 200
      expect(response[:body]).to eq JSON.parse(fib_response, symbolize_names: true)
      expect(a_request(:get, endpoint)).to have_been_made.once
    end
  end

  context 'with request invalid params' do
    let(:endpoint) { 'https://fpbwwwapi.pythonanywhere.com/api/fibonacci/v1/number?n' }

    before do
      stub_request(:get, endpoint).to_return(status: 400, body: fib_err_response, headers: {})
    end

    it 'responses 400' do
      expect { client.get_fibonacci_number(nil) }.to raise_error(
        Api::Fibonacci::Client::FibonacciApiError, "status: 400, body: #{fib_err_response}"
      )
      expect(a_request(:get, endpoint)).to have_been_made.once
    end
  end
end
