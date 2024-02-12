class BureauArticle < ApplicationRecord
  # NOTE: optionalについて https://soccer1356abc.hatenablog.com/entry/2018/09/22/210221
  belongs_to :bureau, optional: true
  belongs_to :article, optional: true
end
