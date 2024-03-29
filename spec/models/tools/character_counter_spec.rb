require 'rails_helper'

RSpec.describe Tools::CharacterCounter do
  describe '#count_characters' do
    context 'when "characters" input' do
      it 'returns 10' do
        counter = build(:tools_character_counter)
        expect(counter.count_characters).to eq 10
      end
    end

    context 'when very long characters input' do
      it 'returns 1234' do
        counter = build(:tools_character_counter, fpl_characters: 'a' * 1234)
        expect(counter.count_characters).to eq 1234
      end
    end

    context 'when empty strings input' do
      it 'returns 0' do
        counter = build(:tools_character_counter, fpl_characters: '')
        expect(counter.count_characters).to eq 0
      end
    end
  end

  describe '#calc_remains_of_upper_limit' do
    context 'when upper limit is empty' do
      it 'returns nil' do
        counter = build(:tools_character_counter)
        expect(counter.calc_remains_of_upper_limit).to be_nil
      end
    end

    context 'when upper limit is 15' do
      it 'returns 5' do
        counter = build(:tools_character_counter, upper_limit: '15')
        expect(counter.calc_remains_of_upper_limit).to be 5
      end
    end

    context 'when upper limit is 10' do
      it 'returns 0' do
        counter = build(:tools_character_counter, upper_limit: '10')
        expect(counter.calc_remains_of_upper_limit).to be 0
      end
    end

    context 'when upper limit is 5' do
      it 'returns -5' do
        counter = build(:tools_character_counter, upper_limit: '5')
        expect(counter.calc_remains_of_upper_limit).to be(-5)
      end
    end

    context 'when upper limit is 0' do
      it 'returns nil' do
        counter = build(:tools_character_counter, upper_limit: '0')
        expect(counter.calc_remains_of_upper_limit).to be_nil
      end
    end

    context 'when upper limit is -5' do
      it 'returns nil' do
        counter = build(:tools_character_counter, upper_limit: '-5')
        expect(counter.calc_remains_of_upper_limit).to be_nil
      end
    end
  end

  describe '#calc_ratio_of_characters_to_upper_limit' do
    context 'when upper limit is empty' do
      it 'returns nil' do
        counter = build(:tools_character_counter, upper_limit: '')
        expect(counter.calc_ratio_of_characters_to_upper_limit).to be_nil
      end
    end

    context 'when upper limit is 15' do
      it 'returns 66.67' do
        counter = build(:tools_character_counter, upper_limit: '15')
        expect(counter.calc_ratio_of_characters_to_upper_limit).to be 66.67
      end
    end

    context 'when upper limit is 10' do
      it 'returns 100.0' do
        counter = build(:tools_character_counter, upper_limit: '10')
        expect(counter.calc_ratio_of_characters_to_upper_limit).to be 100.0
      end
    end

    context 'when upper limit is 5' do
      it 'returns 200.0' do
        counter = build(:tools_character_counter, upper_limit: '5')
        expect(counter.calc_ratio_of_characters_to_upper_limit).to be 200.0
      end
    end

    context 'when upper limit is 0' do
      it 'returns nil' do
        counter = build(:tools_character_counter, upper_limit: '0')
        expect(counter.calc_ratio_of_characters_to_upper_limit).to be_nil
      end
    end

    context 'when upper limit is -5' do
      it 'returns nil' do
        counter = build(:tools_character_counter, upper_limit: '-5')
        expect(counter.calc_ratio_of_characters_to_upper_limit).to be_nil
      end
    end
  end

  describe '#calc_remains_of_lower_limit' do
    subject { counter.calc_remains_of_lower_limit }

    let(:counter) { build(:tools_character_counter, lower_limit:) }

    context 'when lower limit is empty' do
      let(:lower_limit) { '' }

      it { is_expected.to be_nil }
    end

    context 'when lower limit is 15' do
      let(:lower_limit) { '15' }

      it { is_expected.to eq 5 }
    end

    context 'when lower limit is 10' do
      let(:lower_limit) { '10' }

      it { is_expected.to eq 0 }
    end

    context 'when upper limit is 5' do
      let(:lower_limit) { '5' }

      it { is_expected.to eq(-5) }
    end

    context 'when upper limit is 0' do
      let(:lower_limit) { '0' }

      it { is_expected.to be_nil }
    end

    context 'when upper limit is -5' do
      let(:lower_limit) { '-5' }

      it { is_expected.to be_nil }
    end
  end

  describe '#calc_ratio_of_characters_to_lower_limit' do
    subject { counter.calc_ratio_of_characters_to_lower_limit }

    let(:counter) { build(:tools_character_counter, lower_limit:) }

    context 'when lower limit is empty' do
      let(:lower_limit) { '' }

      it { is_expected.to be_nil }
    end

    context 'when lower limit is 15' do
      let(:lower_limit) { '15' }

      it { is_expected.to eq 66.67 }
    end

    context 'when lower limit is 10' do
      let(:lower_limit) { '10' }

      it { is_expected.to eq 100.0 }
    end

    context 'when upper limit is 5' do
      let(:lower_limit) { '5' }

      it { is_expected.to eq 200.0 }
    end

    context 'when upper limit is 0' do
      let(:lower_limit) { '0' }

      it { is_expected.to be_nil }
    end

    context 'when upper limit is -5' do
      let(:lower_limit) { '-5' }

      it { is_expected.to be_nil }
    end
  end
end
