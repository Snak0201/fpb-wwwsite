class Article < ApplicationRecord
  has_paper_trail only: %i[title content]

  has_many :bureau_articles, class_name: 'BureauArticle', dependent: :destroy,
                             inverse_of: :article
  has_many :bureaus, through: :bureau_articles
  has_many :committee_article_tags, dependent: :destroy, inverse_of: :article
  has_many :committees, through: :committee_article_tags

  validates :title, presence: true, length: { maximum: 100 }
  validates :number, presence: true

  scope :admin_index, -> { order(created_at: :desc) }
  scope :published, -> { where.not(published_at: nil) }
  scope :newer, -> { published.order(published_at: :desc) }
  scope :newest, -> { newer.limit(5) }
end
