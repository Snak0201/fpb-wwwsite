module Api
  module Dice
    class V1Controller < ApplicationController
      skip_before_action :verify_authenticity_token

      def simple
        client = Api::Dice::Client.new
        response = client.simple_dice_value
        if response[:status] == 201
          render json: response, status: :ok
        else
          render json: {}, status: :bad_request
        end
      end
    end
  end
end
