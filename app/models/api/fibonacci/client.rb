module Api
  module Fibonacci
    class Client
      # class FibonacciApiError < StandardError
      # end

      attr_accessor :connection

      def initialize
        connection = Faraday.new 'https://fpbwwwapi.pythonanywhere.com' do |conn|
          conn.response :json
        end
        @connection = connection
      end

      def get_fibonacci_number(n = 4)
        handle_response(get_api('/api/fibonacci/v1/number', n:))
      end

      private

      def get_api(url, params)
        connection.get url, params
      end

      def handle_response(res)
        # raise FibonacciApiError, "{\"status\": #{res.status}, \"body\": #{res.body}}" unless res.success?

        response = {}
        response[:status] = res.status
        response[:body] = res.body.deep_symbolize_keys
        response
      end
    end
  end
end
