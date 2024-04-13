require 'rails_helper'
require 'webmock/rspec'

describe Tools::DicesController do
  describe 'POST tools_dice_path' do
    let(:endpoint) { 'https://fpbwwwapi.pythonanywhere.com/api/dice/v1/simple' }

    context 'with response is valid' do
      let(:dice_response) do
        {
          value: 6
        }.to_json
      end

      before do
        stub_request(:post, endpoint).to_return(status: 201, body: dice_response, headers: {})
      end

      it 'returns api value' do
        post tools_dice_path

        expect(response).to have_http_status(:see_other)
        expect(response).to redirect_to tools_dice_path
        expect(response.body).to include '6'
        expect(response.body).to include '201'
        expect(a_request(:post, endpoint)).to have_been_made.once
      end
    end

    context 'when response is invalid' do
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

      it 'returns error' do
        post tools_dice_path

        expect(response).to have_http_status(:see_other)
        expect(response).to redirect_to tools_dice_path
        expect(response.body).to include 'エラー'
        expect(response.body).to include '400'
        expect(a_request(:post, endpoint)).to have_been_made.once
      end
    end
  end
end
