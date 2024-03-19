require 'rails_helper'
require 'webmock/rspec'

RSpec.describe Api::Fibonacci::Client do
  let(:client) { described_class.new }
  let(:fib_response) do
    {
      value: 55
    }.to_json
  end

  before do
    stub_request(
      :get, 'https://fpbwwwapi.pythonanywhere.com/api/fibonacci/v1/number?n=10'
    ).to_return(status: 200, body: fib_response, headers: {})
  end

  it do
    response = client.get_fibonacci_number(10)
    expect(response[:status]).to eq 200
  end
end
