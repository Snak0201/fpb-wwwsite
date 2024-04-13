module Api
  module Dice
    class V1Controller < ApplicationController
      skip_before_action :verify_authenticity_token

      def simple; end
    end
  end
end
