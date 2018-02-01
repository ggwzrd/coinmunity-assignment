class Tag < ApplicationRecord
  has_and_belongs_to_many :posts

  validates :name, presence: true
  validates :icon, presence: true
  validates :description, presence: true

  def total_mentions
    posts.count
  end

  def todays_mentions
    todays_posts_with_tag = posts.select do |post|
      post.created_at.today?
    end
    todays_posts_with_tag.count
  end

end
