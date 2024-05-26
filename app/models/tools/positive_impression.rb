class Tools::PositiveImpression
  include ActiveModel::Model

  attr_accessor :positive_impression_value

  validates :positive_impression_value, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def transitions
    value = positive_impression_value.to_i
    transition = []

    12.times do
      break if value < 1
      transition << value
      value -= 1
    end

    transition
  end

  def status_gains
    status_gain = 0
    gains = []

    transitions.each do |value|
      status_gain += value
      gains << status_gain
    end

    gains
  end

  def transitions_and_status_gains
    transitions.zip(status_gains)
  end
end
