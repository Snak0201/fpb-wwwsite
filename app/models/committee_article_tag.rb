class CommitteeArticleTag < ApplicationRecord
  belongs_to :committee, optional: true
  belongs_to :article, optional: true
end
