require 'rails_helper'

RSpec.describe User, type: :model do

  describe "associations" do
    let(:user) { create :user }

    describe "association with post" do
      it { is_expected.to have_many(:posts) }
    end

    describe "association with report" do
      it { is_expected.to have_many(:reports) }
    end

    describe "association with trust" do
      it { is_expected.to have_many(:trusts) }
    end

    describe "association with profile" do
      it { is_expected.to have_one(:profile) }
    end
  end

  describe "methods" do
    let(:user1) { create :user, last_sign_in_date: Date.yesterday }
    let(:user2) { create :user, last_sign_in_date: Date.today }
    let(:post1) { create :post, user: user1 }
    let!(:post2) { create :post, user: user2 }

    let!(:report1) { create :report, post: post1, user: user2 }
    let!(:report2) { create :report, post: post2, user: user1 }

    let(:source1) { create :source, authenticity: 2 }
    let!(:trust1) { create :trust, post: post1, user: user2, source: source1 }

    describe "update_trustiness" do
      it "updates the trustiness with a given amount" do
        user1.update_trustiness(5)
        expect(user1.trustiness).to eq(15)
      end
    end

    describe "update_last_sign_in_date" do
      it "updates the last_sign_in_date to today" do
        user1.update_last_sign_in_date
        expect(user1.last_sign_in_date).to eq(Date.today)
      end
    end

    describe "check_daily_sign_in" do
      it "gives a trustiness bonus when a user signs in for the first time today" do
        user1.check_daily_sign_in
        expect(user1.trustiness).to eq(10.5)
      end

      it "updates the last_sign_in_date to today" do
        user1.check_daily_sign_in
        expect(user2.last_sign_in_date).to eq(Date.today)
      end

      it "does not give a trustiness bonus when a user has already signed in today" do
        user2.check_daily_sign_in
        expect(user2.trustiness).to eq(10)
      end
    end
  end
end
