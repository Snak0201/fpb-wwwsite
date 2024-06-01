require 'rails_helper'

RSpec.describe Tools::PositiveImpression do
  let(:positive_impression) { build(:tools_positive_impression, value:) }

  describe '#transitions' do
    subject { positive_impression.transitions }

    context 'with large positive value' do
      let(:value) { '25' }

      it { is_expected.to eq [25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14] }
    end

    context 'with small positive value' do
      let(:value) { '6' }

      it { is_expected.to eq [6, 5, 4, 3, 2, 1] }
    end

    context 'with zero' do
      let(:value) { '0' }

      it { is_expected.to eq [] }
    end

    context 'with negative value' do
      let(:value) { '-7' }

      it { is_expected.to eq [] }
    end

    context 'with nothing' do
      let(:value) { '' }

      it { is_expected.to eq [] }
    end

    context 'with string' do
      let(:value) { 'string' }

      it { is_expected.to eq [] }
    end
  end

  describe '#status_gains' do
    subject { positive_impression.status_gains }

    context 'with large positive value' do
      let(:value) { '25' }

      it { is_expected.to eq [25, 49, 72, 94, 115, 135, 154, 172, 189, 205, 220, 234] }
    end

    context 'with small positive value' do
      let(:value) { '6' }

      it { is_expected.to eq [6, 11, 15, 18, 20, 21] }
    end

    context 'with zero' do
      let(:value) { '0' }

      it { is_expected.to eq [] }
    end

    context 'with negative value' do
      let(:value) { '-7' }

      it { is_expected.to eq [] }
    end

    context 'with nothing' do
      let(:value) { '' }

      it { is_expected.to eq [] }
    end

    context 'with string' do
      let(:value) { 'string' }

      it { is_expected.to eq [] }
    end
  end
end
