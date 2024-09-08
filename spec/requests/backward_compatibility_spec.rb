require 'rails_helper'

# NOTE: 公開されているURLにアクセスできることをテストする
# 公開ページを作った際、アクセスが可能かを固定値のURLでテストする
# このテストが恒常的に落ちる変更を加えた場合、メジャーリリースが必要
RSpec.describe 'Backward Compatibility' do
  describe 'GET /' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /about/' do
    it 'returns http success' do
      get '/about/'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /links/' do
    it 'returns http success' do
      get '/links/'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /articles/' do
    it 'returns http success' do
      get '/articles/'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /articles/:id/' do
    let(:article) { create(:article, :published) }

    it 'returns http success' do
      get "/articles/#{article.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /bureaus/:slug/' do
    let(:bureau) { create(:bureau) }

    it 'returns http success' do
      get "/bureaus/#{bureau.slug}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /committees/:slug/' do
    let(:committee) { create(:committee) }

    it 'returns http success' do
      get "/committees/#{committee.slug}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /tools/' do
    it 'returns http success' do
      get '/tools/'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /tools/character_counter/' do
    it 'returns http success' do
      get '/tools/character_counter/'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /tools/stamina_calculator/' do
    it 'returns http success' do
      get '/tools/stamina_calculator'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /tools/stamina_calculator/stamina_from_time' do
    it 'returns http success' do
      get '/tools/stamina_calculator/stamina_from_time'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /tools/dice/' do
    it 'returns http success' do
      get '/tools/dice/'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /tools/positive_impression' do
    it 'returns http success' do
      get '/tools/positive_impression/'
      expect(response).to have_http_status(:success)
    end
  end
end
