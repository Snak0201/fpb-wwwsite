class Tools::PositiveImpression
  include ActiveModel::Model

  attr_accessor :positive_impression_value

  validates :positive_impression_value, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def show_value
    positive_impression_value
  end

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

  def gain_status
    transitions

  end
end
