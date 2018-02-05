class Report < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :reason, presence: true
  # validates :screenshot, presence: true
  # validates :link, presence: true

  DEFAULT_REPORT_TRUSTINESS = -0.2

  def report_trustiness
    DEFAULT_REPORT_TRUSTINESS
  end

end
