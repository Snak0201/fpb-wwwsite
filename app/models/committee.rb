class Committee < ApplicationRecord
  belongs_to :bureau, optional: true
end
