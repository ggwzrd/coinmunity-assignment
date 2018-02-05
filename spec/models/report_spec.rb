require 'rails_helper'

RSpec.describe Report, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:reason) }
    # it { is_expected.to validate_presence_of(:screenshot) }
    # it { is_expected.to validate_presence_of(:link) }
  end

  describe "associations" do
    describe "association with user" do
      it { is_expected.to belong_to(:user) }
    end

    describe "association with post" do
      it { is_expected.to belong_to(:post) }
    end
  end

  describe "methods" do
    describe "trust_trustiness" do
      let(:user1) { create :user, trustiness: -9.8, silenced: false }
      let(:user2) { create :user }
      let(:post) { create :post, user: user1 }
      let!(:report) { create :report, post: post, user: user2 }

      it "is based on the default report trustiness" do
        report.post.user.update_trustiness(report.report_trustiness)
        expect(user1.trustiness).to eq(-10)
      end

      it "changes the user silenced when trustiness <= -10" do
        report.post.user.update_trustiness(report.report_trustiness)
        expect(user1.silenced).to eq(true)
      end
    end
  end

end
