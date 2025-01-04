module EventCarts
  class Mark < ApplicationRecord
    belongs_to :event_carts_cart

    enum :status, { marked: 0, purchased: 1, sold_out: 2 }
  end
end
