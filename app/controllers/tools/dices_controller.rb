module Tools
  class DicesController < ApplicationController
    def show; end

    def create
      response = Api::Dice::Client.new.simple_dice_value
      @status = response[:status]
      @value = response[:body][:value]
      render :show, status: :see_other
    rescue ::Api::Dice::Client::Error => e
      @value = 'エラー'
      @status = api_error_status e
      render :show, status: :see_other
    end

    private

    def api_error_status(err)
      err.message.split(',')[0][-3..].to_i
    end
  end
end
