class Tools::PositiveImpression::Gain < ActiveInteraction::Base
  integer :value

  validates :value, presence: true, numericality: { greater_than: 0 }

  def execute
    values = []

    12.times do |turn|
      positive_inpression = value - turn
      break if positive_inpression <= 0
      values << positive_inpression
    end

    values
  end
end
