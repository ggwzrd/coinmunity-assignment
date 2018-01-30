require 'rails_helper'

RSpec.describe Report, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:reason) }
    # it { is_expected.to validate_presence_of(:screenshot) }
    # it { is_expected.to validate_presence_of(:link) }
  end

  describe "association with user" do
    let(:user) { create :user }

    it "belongs to a user" do
      report = user.reports.build

      expect(report.user).to eq(user)
    end
  end

  describe "association with post" do
    let(:post) { create :post }

    it "belongs to a post" do
      report = post.reports.build

      expect(report.post).to eq(post)
    end
  end

end
