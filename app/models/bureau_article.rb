class BureauArticle < ApplicationRecord
  # associations名を変更する
  # associations名からクラス名を推測できないので指定する
  # foreign_keyに参照先のモデルのカラム名を指定する
  belongs_to :government_bureau, class_name: 'Bureau', foreign_key: :id
  # belongs_to :bureau
  belongs_to :article, foreign_key: :id
end
