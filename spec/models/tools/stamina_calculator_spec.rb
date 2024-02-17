require 'rails_helper'

RSpec.describe Tools::StaminaCalculator do
  let(:calculator) do
    build(:tools_stamina_calculator, current_stamina:, target_stamina:, recover_stamina_seconds:, target_time:)
  end
  let(:current_stamina) { '10' }
  let(:target_stamina) { '100' }
  let(:recover_stamina_seconds) { '80' }
  let(:target_time) { '' }

  describe '#valid?' do
    subject { calculator.valid? }

    context 'when input valid values by time' do
      it { is_expected.to be true }
    end

    context 'when input valid values by stamina' do
      let(:target_time) { Time.zone.parse('2099-12-31T23:59') }
      let(:target_stamina) { '' }

      it { is_expected.to be true }
    end

    context 'when target stamina and target time are blank' do
      let(:target_stamina) { '' }

      it { is_expected.to be false }
    end

    context 'when recover stamina seconds are 0' do
      let(:recover_stamina_seconds) { '0' }

      it { is_expected.to be false }
    end

    context 'when target time is nil' do
      let(:target_time) { nil }

      it { is_expected.to be false }
    end
  end

  describe '#recover_time' do
    subject { calculator.recover_time }

    context 'when target_stamina is larger than current_stamina' do
      let(:result) do
        { hours: 2, minutes: 0, seconds: 0 }
      end

      it { is_expected.to eq result }
    end

    context 'when staminas are float value' do
      let(:current_stamina) { '5.67' }
      let(:target_stamina) { '12.34' }
      let(:result)  do
        { hours: 0, minutes: 8, seconds: 53 }
      end

      it { is_expected.to eq result }
    end

    context 'when target_stamina is smaller than current_stamina' do
      let(:current_stamina) { '200' }
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

    context 'when staminas are float value' do
      let(:current_stamina) { '5.67' }
      let(:target_stamina) { '12.34' }

      it { is_expected.to eq Time.zone.now + 533 }
    end

    context 'when target_stamina is smaller than current_stamina' do
      let(:current_stamina) { '200' }

      it { is_expected.to eq Time.zone.now }
    end
  end

  describe '#to_target_time' do
    let(:target_time) { Time.zone.parse('2024-02-17T15:00') }

    subject { calculator.to_target_time }

    it do
      debugger
    end
  end
end
