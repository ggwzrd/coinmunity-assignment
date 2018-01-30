class Report < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :reason, presence: true
  # validates :screenshot, presence: true
  # validates :link, presence: true

end
