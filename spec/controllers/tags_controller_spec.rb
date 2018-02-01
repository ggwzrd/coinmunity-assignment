require 'rails_helper'

RSpec.describe TagsController, type: :controller do

  describe "methods" do
    let(:tag) { create :tag }
    let(:user) { create :user }
    let!(:post1) {create :post, tags: [tag], created_at: Date.today}
    let!(:post2) {create :post, tags: [tag], created_at: Date.yesterday}

    describe "total_mentions" do
      it "returns the total number of posts with the tag" do
        expect(tag.total_mentions).to eq(2)
      end
    end

    describe "todays_mentions" do
      it "returns the number of posts created today with the tag" do
        expect(tag.todays_mentions).to eq(1)
      end
    end
  end

end
