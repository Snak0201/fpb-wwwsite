require 'rails_helper'

RSpec.describe 'tools index page' do
  describe 'title' do
    it 'is correct' do
      visit tools_path
      expect(page).to have_title 'ツール一覧 | ほしのなか政府'
    end
  end
end
