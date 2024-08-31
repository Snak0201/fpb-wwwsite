class Bureau < ApplicationRecord
  has_many :bureau_articles, dependent: :destroy, inverse_of: :bureau
  has_many :articles, through: :bureau_articles

  has_many :committees, dependent: :nullify

  validates :description, length: { maximum: 100 }
  # TODO: slugは英文字とハイフンのみを許可する
  validates :slug, presence: true, uniqueness: true

  # NOTE: 局のURLにはslugを利用する
  def to_param
    slug
  end
end
