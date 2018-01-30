class Trust < ApplicationRecord
  belongs_to :source
  belongs_to :user
  belongs_to :post

  # validates :screenshot, presence: true
  # validates :link, presence: true
  
end
