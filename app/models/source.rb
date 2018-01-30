class Source < ApplicationRecord
  has_many :trusts

  validates :name, presence: true
  validates :authenticity, presence: true
  validates :logo, presence: true
  validates :description, presence: true
  validates :domain, presence: true
  validates :secure_connection, presence: true
  validates :verified, presence: true

end
