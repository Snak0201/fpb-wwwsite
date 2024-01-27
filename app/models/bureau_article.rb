class BureauArticle < ApplicationRecord
  # associations名を変更する
  # associations名からクラス名を推測できないので指定する
  belongs_to :government_bureau, class_name: 'Bureau'
  # belongs_to :bureau
  belongs_to :article
end
