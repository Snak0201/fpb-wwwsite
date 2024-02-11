class Article < ApplicationRecord
  has_many :bureau_articles, class_name: 'BureauArticle', dependent: :destroy, foreign_key: :article_id, inverse_of: :article
  has_many :bureaus, through: :bureau_articles

  validates :title, :number, presence: true

  scope :admin_index, -> { order(published_at: :desc) }
  scope :published, -> { where.not(published_at: nil) }
  scope :newer, -> { published.order(published_at: :desc) }
  scope :newest, -> { newer.limit(5) }
end
