class Report < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :reason, presence: true
  # validates :screenshot, presence: true
  # validates :link, presence: true

  DEFAULT_REPORT_TRUSTINESS = -0.2

  def update_trustiness_with_new_report
    self.post.user.update_trustiness(DEFAULT_REPORT_TRUSTINESS)
  end

  def derivated_trustiness
    DEFAULT_REPORT_TRUSTINESS
  end

end
