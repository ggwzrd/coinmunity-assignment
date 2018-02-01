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
    let!(:user1) { create :user, trustiness: -9, last_sign_in_date: Date.yesterday }
    let!(:user2) { create :user, trustiness: -11, last_sign_in_date: Date.today }

    describe "update_last_sign_in_date" do
      it "updates the last_sign_in_date to today" do
        user1.update_last_sign_in_date
        expect(user1.last_sign_in_date).to eq(Date.today)
      end
    end

    describe "update_silenced_status" do
      it "sets silenced to false is a user has a trustiness > -10" do
        user1.update_silenced_status
        expect(user1.silenced).to eq(false)
      end

      it "sets silenced to true is a user has a trustiness <= -10" do
        user2.update_silenced_status
        expect(user2.silenced).to eq(true)
      end
    end

    describe "update_trustiness" do
      it "updates the trustiness with a given amount" do
        user1.update_trustiness(5)
        expect(user1.trustiness).to eq(-4)
      end

      it "sets silenced to true when trustiness == -10" do
        user1.update_trustiness(-1)
        expect(user1.silenced).to eq(true)
      end

      it "sets silenced to true when trustiness < -10" do
        user1.update_trustiness(-2)
        expect(user1.silenced).to eq(true)
      end

      it "sets silenced to false when trustiness > -10" do
        user2.update_trustiness(2)
        expect(user2.silenced).to eq(false)
      end
    end

    describe "check_daily_sign_in" do
      it "gives a trustiness bonus when a user signs in for the first time today" do
        user1.check_daily_sign_in
        expect(user1.trustiness).to eq(-8.5)
      end

      it "updates the last_sign_in_date to today" do
        user1.check_daily_sign_in
        expect(user2.last_sign_in_date).to eq(Date.today)
      end

      it "does not give a trustiness bonus when a user has already signed in today" do
        user2.check_daily_sign_in
        expect(user2.trustiness).to eq(-11)
      end
    end
  end
end
