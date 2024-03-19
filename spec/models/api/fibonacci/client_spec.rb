require 'rails_helper'

RSpec.describe Api::Fibonacci::Client do
  let(:mocked_client){ double(described_class) }

  before do
    allow(described_class).to receive(:new).and_return(mocked_client)
    allow(mocked_client).to receive(:get_fibonacci_number).with(10).and_return(
      {
        status: 200,
        body: {
          value: 55
        }
      }
    )
    allow(mocked_client).to receive(:get_fibonacci_number).with(-1).and_return(
      {
        status: 400,
        body: {
          value: nil,
          errors: {
            n: [
                "この値は0以上にしてください。"
            ]
          }
        }
      }
    )
  end

  context '10' do
    it do
      res = described_class.new.get_fibonacci_number(10)
      expect(res[:status]).to eq 200
    end
  end
end
