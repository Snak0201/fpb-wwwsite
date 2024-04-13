require 'rails_helper'
require 'webmock/rspec'

RSpec.describe Api::Dice::Client do
  let(:client) { described_class.new }
  let(:endpoint) { 'https://fpbwwwapi.pythonanywhere.com/api/dice/v1/simple' }

  context 'with request valid params' do
    let(:dice_response) do
      {
        value: 4
      }.to_json
    end

    before do
      stub_request(:post, endpoint).to_return(status: 201, body: dice_response, headers: {})
    end

    it 'responses 201' do
      response = client.dice_number
      expect(response[:status]).to eq 201
      expect(response[:body]).to eq JSON.parse(dice_response, symbolize_names: true)
      expect(a_request(:post, endpoint)).to have_been_made.once
    end
  end

  context 'with request invalid params' do
    let(:dice_response) do
      {
        value: nil,
        errors: {
          detail: 'error'
        }
      }.to_json
    end

    before do
      stub_request(:post, endpoint).to_return(status: 400, body: dice_response, headers: {})
    end

    it 'responses 400' do
      expect { client.dice_number }.to raise_error(
        Api::Dice::Client::Error, "status: 400, body: #{dice_response}"
      )
      expect(a_request(:post, endpoint)).to have_been_made.once
    end
  end
end
