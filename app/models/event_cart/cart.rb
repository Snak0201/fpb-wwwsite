module EventCart
  class Cart < ApplicationRecord
    validates :name, :held_at, :place, presence: true
  end
end
