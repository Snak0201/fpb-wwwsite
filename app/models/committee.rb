class Committee < ApplicationRecord
  belongs_to :bureau, optional: true
  has_many :committee_article_tags, dependent: :destroy, inverse_of: :committee
end
