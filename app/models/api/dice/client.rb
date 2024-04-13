module Api
  module Dice
    class Client
      class Error < StandardError
      end

      attr_accessor :connection

      def initialize
        @connection = Faraday.new 'https://fpbwwwapi.pythonanywhere.com'
      end

      def dice_number
        handle_response(post_api('/api/dice/v1/simple'))
      end

      private

      def post_api(url)
        connection.post url
      rescue Faraday::Error
        raise Error, 'status: 500, body: 通信エラーが発生しました'
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
