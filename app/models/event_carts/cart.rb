module EventCarts
  class Cart < ApplicationRecord
    has_many :marks, class_name: 'EventCarts::Mark', dependent: :destroy

    scope :enabled, -> { where(disabled: false) }

    validates :name, :held_at, :place, presence: true
    # NOTE: 会場地図はURLの入力のみ受け付ける
    validates :atlas, format: { with: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/ }, allow_blank: true

    def to_param
      unique_code
    end
  end
end
