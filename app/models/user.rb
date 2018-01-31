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

  def update_truthiness
    self.truthiness = self.calculate_truthiness
    self.save!
  end

  def calculate_truthiness
    posts_truthiness = posts.reduce(0) { |sum, post|
      sum + post.calculate_post_truthiness_score }
    sign_in_truthiness = sign_in_day_count * 0.5
    (10 + posts_truthiness + sign_in_truthiness).round(2)
  end
end
