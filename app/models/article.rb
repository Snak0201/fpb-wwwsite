class Article < ApplicationRecord
  # foreign_keyに中間テーブルにあるカラム名を指定する
  # class_nameはなくても良いが、書くと親切
  has_many :bureau_articles, dependent: :destroy, class_name: 'BureauArticle', foreign_key: :government_bureau_id
  # a.government_bureausの形でbureauを取得できる
  # throughを忘れないようにする
  has_many :government_bureaus, through: :bureau_articles
end
