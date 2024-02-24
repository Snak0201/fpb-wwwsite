require 'rails_helper'

RSpec.describe 'top page' do
  describe '#announcement' do
    let(:announcement) { create(:admins_announcement) }

    context 'when new announcement created' do
      let(:content) { 'お知らせを更新しました' }

      it 'shows new one' do
        visit root_path
        within('#announcement') { expect(page).to have_content announcement.content }
        create(:admins_announcement, content:)
        visit root_path
        within('#announcement') { expect(page).to have_content announcement.content }
      end
    end
  end

  describe '#bureaus' do
    before do
      create_list(:bureau, 3)
    end

    it 'shows all bureaus' do
      visit root_path
      within('#bureaus') do
        Bureau.find_each do |bureau|
          expect(page).to have_content bureau.name
        end
      end
    end
  end

  describe 'footer' do
    it 'has link to about page' do
      visit root_path
      within('footer') { click_on 'Hoshinonaka Government' }
      expect(page).to have_current_path about_path, ignore_query: true
    end
  end
end
