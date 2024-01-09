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
        counter = build(:tools_character_counter, characters: 'a' * 1234)
        expect(counter.count_characters).to eq 1234
      end
    end

    context 'when empty strings input' do
      it 'returns 0' do
        counter = build(:tools_character_counter, characters: '')
        expect(counter.count_characters).to eq 0
      end
    end
  end
end
