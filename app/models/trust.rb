class Trust < ApplicationRecord
  belongs_to :source
  belongs_to :user
  belongs_to :post

  validates :comment, presence: true
  # validates :screenshot, presence: true
  # validates :link, presence: true

  DEFAULT_TRUST_TRUSTINESS = 0.1

  def trust_trustiness
    (DEFAULT_TRUST_TRUSTINESS/trust.source.authenticity).round(2)
  end

end
