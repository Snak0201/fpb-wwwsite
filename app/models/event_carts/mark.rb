module EventCarts
  class Mark < ApplicationRecord
    belongs_to :cart, class_name: 'EventCarts::Cart', dependent: :destroy

    enum :status, { marked: 0, purchased: 1, sold_out: 2 }

    validates :name, :order_number, presence: true
    validates :circle_sns, format: { with: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/ },
                           allow_blank: true
  end
end
