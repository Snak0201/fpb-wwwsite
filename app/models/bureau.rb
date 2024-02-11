class Bureau < ApplicationRecord
  has_many :bureau_articles, dependent: :destroy
  has_many :articles, through: :bureau_articles, inverse_of: :bureaus
end
