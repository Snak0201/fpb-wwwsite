require 'rails_helper'

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

  describe 'GET /tools/stamina_calculator/stamina_from_time/stamina_from_time/' do
    it 'returns http success' do
      get '/tools/stamina_calculator/stamina_from_time'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /tools/dices/show/' do
    it 'returns http success' do
      get '/tools/dices/show'
      expect(response).to have_http_status(:success)
    end
  end
end
