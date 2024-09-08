require 'rails_helper'

RSpec.describe 'committee page title' do
  let(:committee) { create(:committee) }

  it 'is correct' do
    visit committee_path(committee)
    expect(page).to have_title "#{committee.name} | ほしのなか政府"
  end
end
