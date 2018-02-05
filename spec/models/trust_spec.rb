require 'rails_helper'

RSpec.describe Trust, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:comment) }
    # it { is_expected.to validate_presence_of(:screenshot) }
    # it { is_expected.to validate_presence_of(:link) }
  end

  describe "associations" do
    describe "association with source" do
      it { is_expected.to belong_to(:source) }
    end

    describe "association with user" do
      it { is_expected.to belong_to(:user) }
    end

    describe "association with post" do
      it { is_expected.to belong_to(:post) }
    end
  end

  describe "methods" do
    describe "trust_trustiness" do
      let(:user1) { create :user, trustiness: -10.05, silenced: true }
      let(:user2) { create :user }
      let(:post) { create :post, user: user1 }
      let(:source1) { create :source, authenticity: 2 }
      let(:source2) { create :source, authenticity: 1 }
      let!(:trust1) { create :trust, post: post, user: user2, source: source1 }
      let!(:trust2) { create :trust, post: post, user: user2, source: source2 }

      it "is based on the default trust trustiness" do
        trust1.post.user.update_trustiness(trust1.trust_trustiness)
        expect(user1.trustiness).to eq(-10)
      end

      it "changes the user trustiness based on source authenticity" do
        trust2.post.user.update_trustiness(trust2.trust_trustiness)
        expect(user1.trustiness).to eq(-9.95)
      end

      it "changes the user silenced when trustiness > -10" do
        trust2.post.user.update_trustiness(trust2.trust_trustiness)
        expect(user1.silenced).to eq(false)
      end
    end
  end
end
