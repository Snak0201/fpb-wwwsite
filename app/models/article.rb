class Article < ApplicationRecord
  has_many :bureau_articles, class_name: 'BureauArticle', foreign_key: :bureau_id, inverse_of: :article,
                             dependent: :destroy
  has_many :bureaus, through: :bureau_articles

  validates :title, :number, presence: true

  scope :published, -> { where.not(published_at: nil) }
end
