RSpec.describe 'root_path' do
  it do
    visit root_path
    click_on 'Hoshinonaka Government'
    expect(page).to have_content 'ほしのなか政府について'
  end
end
