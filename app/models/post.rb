class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :trusts, dependent: :destroy
  has_many :reports, dependent: :destroy

  validates :content, presence: true, length: {maximum: 5000}
  validates :summary, length: { maximum: 500 }
  validates :link, presence: true
  validates :images, presence: true
  # validates :video, presence: true

  def summarize
    # puts self.content
    if self.content.length < 500
      return self.content
    else
      return self.content[0..496]+"..."
    end
  end

  def calculate_post_trustiness_score
    self.calculate_trusts_score + self.calculate_reports_score
  end

  def calculate_reports_score
    (reports.count * -0.2).round(2)
  end

  def calculate_trusts_score
    trusts.reduce(0) { |sum, trust|
      sum + (0.1/trust.source.authenticity) }.round(2)
  end

end
