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

    # describe "calculate_trustiness" do
    #   it "returns 10 if the user has no trusts/reports and has never signed in" do
    #     user = User.new
    #     expect(user.calculate_trustiness).to eq(10)
    #   end
    #
    #   it "calculates trustiness based on login" do
    #     user = User.new(sign_in_day_count: 2)
    #     expect(user.calculate_trustiness).to eq(11)
    #   end
    #
    #   it "calculates trustiness based on posts trustiness" do
    #     expect(user1.calculate_trustiness).to eq(9.85)
    #   end
    #
    #   it "calculates trustiness based on login and posts trustiness" do
    #     expect(user2.calculate_trustiness).to eq(10.8)
    #   end
    # end
    #
    # describe "update_trustiness" do
    #   let!(:report) { create :report, post: post1, user: user2 }
    #
    #   it "changes the trustiness when a post gets a report" do
    #     user1.update_trustiness
    #     expect(user1.trustiness).to eq(9.65)
    #   end
    #
    #   let(:source) { create :source, authenticity: 2}
    #   let!(:trust) { create :trust, post: post2, source: source, user: user1 }
    #
    #   it "changes the trustiness when a post gets a trust" do
    #     user2.update_trustiness
    #     expect(user2.trustiness).to eq(10.85)
    #   end
    #
    #   it "changes the trustiness when a user gets a new daily sign in" do
    #     user2.sign_in_day_count = 3
    #     user2.save!
    #     user2.update_trustiness
    #     expect(user2.trustiness).to eq(11.35)
    #   end
    # end
  end
end
