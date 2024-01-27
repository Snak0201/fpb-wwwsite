class Bureau < ApplicationRecord
  has_many :bureau_articles
  has_many :articles, through: :bureau_articles
end
