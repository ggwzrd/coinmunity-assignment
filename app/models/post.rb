class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :trusts
  has_many :reports

  validates :content, presence: true, length: { maximum: 500 }
  validates :link, presence: true
  validates :images, presence: true
  # validates :video, presence: true

  def calculate_reports_score
    (reports.count * -0.2).round(4)
  end



end
