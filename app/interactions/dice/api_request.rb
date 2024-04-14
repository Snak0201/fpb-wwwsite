module Dice
  class ApiRequest < ActiveInteraction::Base
    def execute
      client = Api::Dice::Client.new
      client.simple_dice_value
    rescue ::Api::Dice::Client::Error => e
      Rails.logger.error(e)
      errors.add(:base, e.message)
    end
  end
end
