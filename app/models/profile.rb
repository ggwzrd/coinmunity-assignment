class Profile < ApplicationRecord
  belongs_to :user

  validates :nickname, presence: true, uniqueness: true
  validates :bio, length: { maximum: 200 }

  FIRST_NAME_TRUSTINESS_BONUS = 1
  LAST_NAME_TRUSTINESS_BONUS = 1
  PICTURE_TRUSTINESS_BONUS = 2
  BIO_TRUSTINESS_BONUS = 1

  def first_name_trustiness
    FIRST_NAME_TRUSTINESS_BONUS
  end

  def last_name_trustiness
    LAST_NAME_TRUSTINESS_BONUS
  end

  def picture_trustiness
    PICTURE_TRUSTINESS_BONUS
  end

  def bio_trustiness
    BIO_TRUSTINESS_BONUS
  end

end
