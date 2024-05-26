class Tools::PositiveImpression
  include ActiveModel::Model

  attr_accessor :positive_impression_value

  validates :positive_impression_value, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def show_value
    positive_impression_value
  end

  def transition_list
    list_value = positive_impression_value.to_i
    transition = []

    12.times do
      break if list_value < 1
      transition << list_value
      list_value -= 1
    end

    transition
  end
end
