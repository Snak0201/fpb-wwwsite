class Committee < ApplicationRecord
  belongs_to :bureau, optional: true
  has_many :committee_article_tags, dependent: :destroy, inverse_of: :committee

  scope :by_bureau, -> { order(:bureau_id) }

  validates :name, presence: true, uniqueness: true
  validates :description, length: { maximum: 100 }
  # TODO: slugは英文字とハイフンのみを許可する
  validates :slug, presence: true, uniqueness: true

  def to_param
    slug
  end
end
