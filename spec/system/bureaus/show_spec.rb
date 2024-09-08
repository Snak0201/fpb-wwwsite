require 'rails_helper'

RSpec.describe 'show bureau page' do
  let(:bureau) { Bureau.first }

  before do
    create_list(:bureau, 3)

    create_list(:article, 15, :published)
    create_list(:article, 7)
    Article.find_each do |article|
      create(:bureau_article, bureau:, article:)
    end
  end

  describe '#articles' do
    context 'with no articles' do
      it 'does not have an articles list' do
        visit bureau_path(Bureau.last)
        expect(page).to have_no_content '記事一覧'
      end
    end

    context 'with 15 published and 7 draft articles' do
      it 'shows 15 articles' do
        visit bureau_path(bureau)
        within('#articles') do
          expect(page).to have_content 'Test Article', count: 10
          click_on 'Next'
          expect(page).to have_content 'Test Article', count: 5
        end
      end
    end

    context 'with second bureau' do
      before do
        create_list(:article, 24, :published)
        create_list(:article, 9)
        bureau = Bureau.second
        Article.find_each do |article|
          create(:bureau_article, bureau:, article:)
        end
      end

      it 'shows 15 articles' do
        visit bureau_path(Bureau.first)
        within('#articles') do
          expect(page).to have_content 'Test Article', count: 10
          click_on 'Next'
          expect(page).to have_content 'Test Article', count: 5
        end
      end
    end
  end

  describe '#committees' do
    context 'when bureau has no committees' do
      it 'does not have a committees list' do
        visit bureau_path(bureau)
        expect(page).to have_no_content '委員会一覧'
      end
    end

    context 'when bureau has committees' do
      let(:committee) { create(:committee, :with_bureau) }

      it 'has a committees list' do
        visit bureau_path(committee.bureau)
        expect(page).to have_content '委員会一覧'

        within('#committees') do
          expect(page).to have_link committee.name, href: committee_path(committee)
        end
      end
    end
  end
end
