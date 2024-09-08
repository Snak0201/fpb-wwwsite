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
        expect(page).to have_content '局一覧'
        Bureau.find_each do |bureau|
          expect(page).to have_content bureau.name
        end
      end
    end
  end

  describe '#committees' do
    before do
      create_list(:bureau, 3)
      create(:committee, :with_bureau, bureau: Bureau.last, name: 'C-1')
      create(:committee, :with_bureau, bureau: Bureau.first, name: 'C-2')
      create(:committee, :with_bureau, :special, bureau: Bureau.last, name: 'C-3')
      create(:committee, name: 'C-4')
    end

    it 'has all committees and displays correct order' do
      visit root_path
      within('#committees') do
        expect(page).to have_content '委員会一覧'
        expect(page.text).to match(/C-4.*C-2.*C-3.*C-1/)
        expect(page).to have_no_content '常任委員会'
        expect(page).to have_no_content '特別委員会'
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
