module Admins
  class FibonacciNumbersController < ApplicationController
    def show
      connection = Faraday.new 'https://fpbwwwapi.pythonanywhere.com' do |conn|
        conn.response :json
      end

      response = connection.get '/api/fibonacci/v1/number', n: 7
      @number = response.body['value']
    end

    def create

    end
  end
end
