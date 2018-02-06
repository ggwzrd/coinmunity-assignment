class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :trusts, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :content, presence: true, length: {maximum: 5000}
  validates :summary, length: { maximum: 500 }
  validates :link, presence: true

  def summarize
    if self.content.length < 500
      return self.content
    else
      return self.content[0..496]+"..."
    end
  end

end
