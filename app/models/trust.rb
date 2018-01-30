class Trust < ApplicationRecord
  belongs_to :source
  belongs_to :user
  belongs_to :post
end
