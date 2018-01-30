require 'rails_helper'

RSpec.describe Profile, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:picture)}
  end

  describe "association with user" do
    let(:user) { create :user }

    it "belongs to a user" do
      profile = user.build_profile

      expect(profile.user).to eq(user)
    end
  end

end
