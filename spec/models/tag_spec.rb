require 'rails_helper'

RSpec.describe Tag, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe "association with post" do
    let(:tag) { create :tag }
    let(:user) { create :user }
    let!(:post1) { create :post, user: user, tags: [tag] }
    let!(:post2) { create :post, user: user, tags: [tag] }

    it "has many posts" do
      expect(tag.posts).to include(post1)
      expect(tag.posts).to include(post2)
    end
  end

end
