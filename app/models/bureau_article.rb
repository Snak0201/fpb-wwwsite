class BureauArticle < ApplicationRecord
  belongs_to :bureau
  belongs_to :article
end
