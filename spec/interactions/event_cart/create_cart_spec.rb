require 'rails_helper'

RSpec.describe EventCart::CreateCart do
  subject(:service) { described_class.run(name:, held_at:, place:) }

  let(:name) { 'event' }
  let(:held_at) { Time.zone.today }
  let(:place) { 'event place' }

  context 'with valid params' do
    let(:unique_code) { '123e4567-e89b-12d3-a456-7890abcdef01' }

    before do
      allow(SecureRandom).to receive(:uuid).and_return(unique_code)
    end

    it 'creates records and returns unique_code' do
      expect { service }.to change(EventCart::Cart, :count).by(1)
      expect(service.result).to eq unique_code
    end
  end

  context 'with invalid params' do
    let(:name) { nil }
    let(:held_at) { nil }
    let(:place) { nil }

    it 'does not create records and returns nil' do
      expect { service }.not_to change(EventCart::Cart, :count)
      expect(service.result).to be_nil
    end
  end
end
