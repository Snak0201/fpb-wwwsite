require 'rails_helper'

RSpec.describe 'stamina calculator (time) with params' do
  context 'when recover_stamina_seconds=80' do
    it 'default value is 80.0' do
      visit tools_stamina_calculator_path(recover_stamina_seconds: 80)

      expect(page).to have_field 'tools_stamina_calculator_recover_stamina_seconds', with: 80.0
    end
  end

  context 'when recover_stamina_seconds=50.50' do
    it 'default value is 50.50' do
      visit tools_stamina_calculator_path(recover_stamina_seconds: 50.50)

      expect(page).to have_field 'tools_stamina_calculator_recover_stamina_seconds', with: 50.50
    end
  end

  context 'when recover_stamina_seconds=-10' do
    it 'default value is -10' do
      visit tools_stamina_calculator_path(recover_stamina_seconds: -10)

      expect(find_by_id('tools_stamina_calculator_recover_stamina_seconds')).to have_content ''
    end
  end
end
