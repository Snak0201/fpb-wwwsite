require 'rails_helper'

RSpec.describe 'delete a committee' do
  let(:admin) { create(:admin) }
  let(:committee) { create(:committee, :with_bureau) }

  before do
    admin_log_in admin
  end

  it 'is success to delete a committee' do
    visit edit_admin_committee_path(committee)
    click_on '委員会を削除する'
    expect(page).to have_current_path admin_committees_path, ignore_query: true
    expect(page).to have_content '委員会が削除されました'
    expect(page).to have_no_content committee.name
    expect(page).to have_no_content committee.slug
  end
end
