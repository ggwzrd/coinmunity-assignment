class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :trusts, dependent: :destroy
  has_many :reports, dependent: :destroy

  validates :content, presence: true, length: { maximum: 500 }
  validates :link, presence: true
  validates :images, presence: true
  # validates :video, presence: true

end
