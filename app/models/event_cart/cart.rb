module EventCart
  class Cart < ApplicationRecord
    validates :name, :held_at, :place, presence: true
    # NOTE: 会場地図はURLの入力のみ受け付ける
    validates :atlas, format: { with: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/ }, allow_blank: true
  end
end
