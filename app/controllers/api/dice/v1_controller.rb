module Api
  module Dice
    class V1Controller < ApplicationController
      skip_before_action :verify_authenticity_token

      def simple
        client = Api::Dice::Client.new
        client.simple_dice_value
      end
    end
  end
end
