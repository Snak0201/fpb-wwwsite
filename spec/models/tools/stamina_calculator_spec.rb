require 'rails_helper'

RSpec.describe Tools::StaminaCalculator do
  let(:calculator) do
    build(:tools_stamina_calculator, current_stamina:, target_stamina:, recover_stamina_seconds:)
  end
  let(:current_stamina) { 10 }
  let(:target_stamina) { 100 }
  let(:recover_stamina_seconds) { 80 }

  describe '#recover_time' do
    subject { calculator.recover_time }

    context 'when target_stamina is larger than current_stamina' do
      let(:result) do
        { hours: 2, minutes: 0, seconds: 0 }
      end

      it { is_expected.to eq result }
    end

    context 'when target_stamina is smaller than current_stamina' do
      let(:current_stamina) { 200 }
      let(:result) do
        { hours: 0, minutes: 0, seconds: 0 }
      end

      it { is_expected.to eq result }
    end

    context 'when recover_stamina_seconds is 0' do
      let(:recover_stamina_seconds) { 0 }
      let(:result) do
        { hours: 0, minutes: 0, seconds: 0 }
      end

      it { is_expected.to eq result }
    end
  end

  describe '#recover_at' do
    subject { calculator.recover_at }

    before { freeze_time }

    context 'when target_stamina is larger than current_stamina' do
      it { is_expected.to eq Time.zone.now + 7200 }
    end

    context 'when target_stamina is smaller than current_stamina' do
      let(:current_stamina) { 200 }

      it { is_expected.to eq Time.zone.now }
    end

    context 'when recover_stamina_seconds is 0' do
      let(:recover_stamina_seconds) { 0 }

      it { is_expected.to eq Time.zone.now }
    end
  end
end
