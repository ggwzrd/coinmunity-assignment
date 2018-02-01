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
    describe "update_trustiness_with_new_trust" do
      let(:user1) { create :user }
      let(:user2) { create :user }
      let(:post) { create :post, user: user1 }
      let(:source) { create :source, authenticity: 2 }
      let!(:trust) { create :trust, post: post, user: user2, source: source }

      it "changes the user trustiness" do
        trust.update_trustiness_with_new_trust
        expect(user1.trustiness).to eq(10.05)
      end
    end
  end

end
