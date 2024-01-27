class Article < ApplicationRecord
  has_many :bureau_articles
  has_many :bureaus, through: :bureau_articles
end
