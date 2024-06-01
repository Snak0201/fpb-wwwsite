module Tools
  class PositiveImpression
    include ActiveModel::Model

    attr_accessor :value

    validates :value, presence: true, numericality: { greater_than: 0 }

    def transitions
      int_value = value.to_i
      transition = []

      12.times do
        break if int_value < 1

        transition << int_value
        int_value -= 1
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
end
