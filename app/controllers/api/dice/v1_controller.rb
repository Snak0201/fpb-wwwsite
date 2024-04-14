module Api
  module Dice
    class V1Controller < ApplicationController
      skip_before_action :verify_authenticity_token

      def simple
        response = ::Dice::ApiRequest.run
        if response.valid?
          render json: response, status: :ok
        else
          render json: response.errors.full_messages, status: :unprocessable_entity
        end
      end
    end
  end
end
