require 'rails_helper'

RSpec.describe 'top page' do
  it do
    visit root_path
    within('footer') { click_on 'Hoshinonaka Government' }
    expect(page).to have_current_path about_path, ignore_query: true
  end
end
