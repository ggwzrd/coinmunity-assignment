class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags

  validates :content, presence: true, length: { maximum: 500 }
  validates :link, presence: true
  validates :images, presence: true
  # validates :video, presence: true
  validates :is_spam, presence: true

end
