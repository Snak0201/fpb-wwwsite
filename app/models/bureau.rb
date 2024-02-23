class Bureau < ApplicationRecord
  has_many :bureau_articles, dependent: :destroy, inverse_of: :bureau
  has_many :articles, through: :bureau_articles

  validates :description, length: { maximum: 100 }
end
