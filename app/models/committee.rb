class Committee < ApplicationRecord
  belongs_to :bureau, optional: true
  has_many :committee_article_tags, dependent: :destroy, inverse_of: :committee
  has_many :articles, through: :committee_article_tags

  scope :sorted, -> { order(:bureau_id, special: :desc) }

  validates :name, presence: true, uniqueness: true
  validates :description, length: { maximum: 100 }
  # TODO: slugは英文字とハイフンのみを許可する
  validates :slug, presence: true, uniqueness: true

  def to_param
    slug
  end

  def classification
    bureau_name + special_string
  end

  def bureau_name
    return bureau.name if bureau

    '独立委員会'
  end

  private

  def special_string
    return ' 特別委員会' if special

    ' 常任委員会'
  end
end
