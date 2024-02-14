FactoryBot.define do
  factory :tools_stamina_calculator, class: 'Tools::StaminaCalculator' do
    current_stamina { 10 }
    target_stamina { 100 }
    recover_one_stamina_seconds { 80 }
  end
end
