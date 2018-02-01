class Trust < ApplicationRecord
  belongs_to :source
  belongs_to :user
  belongs_to :post

  # validates :screenshot, presence: true
  # validates :link, presence: true

  DEFAULT_TRUST_TRUSTINESS = 0.1

  def update_trustiness_with_new_trust
    trust_trustiness = (DEFAULT_TRUST_TRUSTINESS/trust.source.authenticity).round(2)
    self.post.user.update_trustiness(trust_trustiness)
  end

end
