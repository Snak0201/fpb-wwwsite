class Article < ApplicationRecord
  has_many :bureau_articles, dependent: :destroy
  has_many :government_bureaus, through: :bureau_articles
end
