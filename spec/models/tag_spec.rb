require 'rails_helper'

RSpec.describe Tag, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe "associations" do
    describe "association with post" do
      it { is_expected.to have_and_belong_to_many(:posts) }
    end
  end

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
