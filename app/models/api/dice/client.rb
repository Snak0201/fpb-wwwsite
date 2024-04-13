module Api
  module Dice
    class Client
      class Error < StandardError
      end

      attr_accessor :connection

      def initialize
        connection = Faraday.new 'https://fpbwwwapi.pythonanywhere.com'
        @connection = connection
      end

      def dice_number(n) # rubocop:todo Naming/MethodParameterName
        handle_response(post_api('/api/dice/v1/simple', n:))
      end

      private

      def post_api(url, params)
        connection.post url, params
      end

      def handle_response(res)
        raise Error, "status: #{res.status}, body: #{res.body}" unless res.success?

        response = {}
        response[:status] = res.status
        response[:body] = JSON.parse(res.body, symbolize_names: true)
        response
      end
    end
  end
end
