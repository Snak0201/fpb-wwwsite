FactoryBot.define do
  factory :tools_character_counter, class: 'Tools::CharacterCounter' do
    characters { 'characters' }
    upper_limit { '' }
  end
end
