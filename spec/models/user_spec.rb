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
    let(:user1) { create :user, sign_in_day_count: 0 }
    let(:user2) { create :user, sign_in_day_count: 2 }
    let(:post1) { create :post, user: user1 }
    let!(:post2) { create :post, user: user2 }

    let!(:report1) { create :report, post: post1, user: user2 }
    let!(:report2) { create :report, post: post2, user: user1 }

    let(:source1) { create :source, authenticity: 2 }
    let!(:trust1) { create :trust, post: post1, user: user2, source: source1 }


    describe "set_truthiness" do
      it "returns 10 if the user has no trusts/reports and has never signed in" do
        user = User.new
        expect(user.calculate_truthiness).to eq(10)
      end

      it "calculates truthiness based on login" do
        user = User.new(sign_in_day_count: 2)
        expect(user.calculate_truthiness).to eq(11)
      end

      it "calculates truthiness based on posts truthiness" do
        expect(user1.calculate_truthiness).to eq(9.85)
      end

      it "calculates truthiness based on login and posts truthiness" do
        expect(user2.calculate_truthiness).to eq(10.8)
      end
    end
  end
end
