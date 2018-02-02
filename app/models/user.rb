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

  DAILY_SIGN_IN_REWARD = 0.5

  def check_daily_sign_in
    return if last_sign_in_at == Date.today
    self.update_trustiness(DAILY_SIGN_IN_REWARD)
    # self.update_last_sign_in_date
  end

  def update_trustiness(amount)
    self.trustiness = (self.trustiness + amount).round(2)
    self.save!
    self.update_silenced_status
  end

  def update_silenced_status
    if trustiness <= -10 && !silenced
      self.silenced = true
    elsif trustiness > -10 && silenced
      self.silenced = false
    end
    self.save!
  end

  # def update_last_sign_in_date
  #   self.last_sign_in_date = Date.today
  #   self.save!
  # end

end
