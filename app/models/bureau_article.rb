class BureauArticle < ApplicationRecord
  # association名はカラム名から _id をとったもの
  # class_nameは参照先モデル名を指定する
  # foreign_keyに参照先モデルにある自分を指すカラム名を指定する
  # foreign_keyを手動で設定したとき、inverse_ofも設定する
  # inverse_ofは参照先モデルからこのモデルを指すassociation名を指定する
  belongs_to :government_bureau, class_name: 'Bureau', foreign_key: :id, inverse_of: :bureau_articles
  # belongs_to :bureau

  # association名から推測できるときは省略しても良い
  belongs_to :article
end
