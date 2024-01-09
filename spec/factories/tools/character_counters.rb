FactoryBot.define do
  factory :tools_character_counter, class: 'Tools::CharacterCounter' do
    characters { 'characters' }
  end
end
