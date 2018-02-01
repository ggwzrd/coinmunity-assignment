require 'rails_helper'

RSpec.describe Trust, type: :model do

  describe "validations" do
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
    describe "update_trustiness_with_new_report" do
      let(:user1) { create :user }
      let(:user2) { create :user }
      let(:post) { create :post, user: user1 }
      let!(:report) { create :report, post: post, user: user2 }

      it "changes the user trustiness" do
        report.update_trustiness_with_new_report
        expect(user1.trustiness).to eq(9.8)
      end
    end
  end

end
