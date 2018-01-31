class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_secure_token

  has_many :posts
  has_many :reports
  has_many :trusts
  has_one :profile

  def set_trustiness
    posts_trustiness = posts.reduce(0) { |sum, post|
      sum + post.calculate_post_trustiness_score }
    sign_in_trustiness = sign_in_day_count * 0.5
    (10 + posts_trustiness + sign_in_trustiness).round(2)
  end
end
