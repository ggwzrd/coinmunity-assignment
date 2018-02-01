class Profile < ApplicationRecord
  belongs_to :user

  validates :nickname, presence: true, uniqueness: true
  validates :bio, length: { maximum: 200 }

end
