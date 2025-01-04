module EventCarts
  class Mark < ApplicationRecord
    belongs_to :cart, class_name: 'EventCarts::Cart', dependent: :destroy

    enum :status, { marked: 0, purchased: 1, sold_out: 2 }
  end
end
