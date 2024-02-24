require 'rails_helper'

RSpec.describe 'show bureau page' do
  before do
    create_list(:bureau, 3)

    create_list(:article, 15, :published)
    create_list(:article, 7)
    bureau = Bureau.first
    Article.find_each do |article|
      create(:bureau_article, bureau:, article:)
    end
  end

  describe '#articles' do
    context 'with 15 published and 7 draft articles' do
      it 'shows 15 articles' do
        visit bureau_path(Bureau.first)
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
end
