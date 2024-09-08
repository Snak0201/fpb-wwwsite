require 'rails_helper'

RSpec.describe 'show committee page' do
  let(:committee) { Committee.first }

  before do
    create_list(:committee, 3)

    create_list(:article, 15, :published)
    create_list(:article, 7)
    Article.find_each do |article|
      create(:committee_article_tag, committee:, article:)
    end
  end

  describe '#articles' do
    context 'with no articles' do
      it 'does not have an articles list' do
        visit committee_path(Committee.last)
        expect(page).to have_no_content '記事一覧'
      end
    end

    context 'with 15 published and 7 draft articles' do
      it 'shows 15 articles with pagination per 10' do
        visit committee_path(committee)
        within('#articles') do
          expect(page).to have_content 'Test Article', count: 10
          click_on 'Next'
          expect(page).to have_content 'Test Article', count: 5
        end
      end
    end
  end

  describe '#bureau' do
    context 'without bureaus' do
      it 'has no bureaus' do
        visit committee_path(committee)
        expect(page).to have_no_content '管轄局'
      end
    end

    context 'with a bureau' do
      let(:committee) { create(:committee, :with_bureau) }

      it 'has link to the bureau' do
        visit committee_path(committee)
        expect(page).to have_content '管轄局'
        within('#bureau') { expect(page).to have_link committee.bureau_name, href: bureau_path(committee.bureau) }
      end
    end
  end

  describe '#classification' do
    context 'without bureaus' do
      it 'has correct classification' do
        visit committee_path(committee)
        expect(page).to have_content '委員会種別'
        within('#classification') { expect(page).to have_content '独立委員会 常任委員会' }
      end
    end

    context 'with a bureau and special committee' do
      let(:committee) { create(:committee, :with_bureau, :special) }

      it 'has correct classification' do
        visit committee_path(committee)
        expect(page).to have_content '委員会種別'
        within('#classification') { expect(page).to have_content "#{committee.bureau.name} 特別委員会" }
      end
    end
  end
end
