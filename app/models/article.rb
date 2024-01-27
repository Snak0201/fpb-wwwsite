class Article < ApplicationRecord
  # class_nameは参照先モデル名を指定する
  # foreign_keyに参照先モデルにある自分を指すカラム名を指定する
  # foreign_keyを手動で設定したとき、inverse_ofも設定する
  # inverse_ofは参照先モデルからこのモデルを指すassociation名を指定する
  has_many :bureau_articles, dependent: :destroy, class_name: 'BureauArticle',
                             inverse_of: :article
  # a.government_bureausの形でbureauを取得できる
  # throughを忘れないようにする
  has_many :government_bureaus, through: :bureau_articles
end
