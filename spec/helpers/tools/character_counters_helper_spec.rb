require 'rails_helper'

RSpec.describe Tools::CharacterCountersHelper do
  describe '#show_remains_of_upper_limit' do
    subject { show_remains_of_upper_limit remains_of_upper_limit }

    context 'when remains_of_upper_limit is positive' do
      let(:remains_of_upper_limit) { 100 }

      it { is_expected.to eq '上限まで残り100字です' }
    end

    context 'when remains_of_upper_limit is 0' do
      let(:remains_of_upper_limit) { 0 }

      it { is_expected.to eq '上限まで残り0字です' }
    end

    context 'when remains_of_upper_limit is negative' do
      let(:remains_of_upper_limit) { -100 }

      it { is_expected.to eq '上限を100字超過しています' }
    end
  end

  describe '#show_remains_of_lower_limit' do
    subject { show_remains_of_lower_limit remains_of_lower_limit }

    context 'when remains_of_lower_limit is positive' do
      let(:remains_of_lower_limit) { 100 }

      it { is_expected.to eq '下限まで100字不足しています' }
    end

    context 'when remains_of_lower_limit is 0' do
      let(:remains_of_lower_limit) { 0 }

      it { is_expected.to eq '下限をクリアし、0字多いです' }
    end

    context 'when remains_of_lower_limit is negative' do
      let(:remains_of_lower_limit) { -100 }

      it { is_expected.to eq '下限をクリアし、100字多いです' }
    end
  end
end
