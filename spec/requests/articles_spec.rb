require 'rails_helper'

RSpec.describe 'Articles' do
  let(:article) { create(:article) }

  describe 'GET /articles/:article_id' do
    it 'returns http success' do
      get "/articles/#{article.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
