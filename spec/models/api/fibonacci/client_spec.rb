require 'rails_helper'

RSpec.describe Api::Fibonacci::Client do
  let(:mocked_client){ double(described_class) }

  before do
    allow(described_class).to recieve(:new).and_return(mocked_client)
    allow(mocked_client).to recieve(:get_fibonacci_number).with(10).and_return(55)
  end
end
