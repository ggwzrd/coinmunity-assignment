require 'rails_helper'

RSpec.describe Profile, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:nickname) }
    it { is_expected.to validate_length_of(:last_name).is_at_most(200) }
  end

  describe "associations" do
    describe "association with user" do
      it { is_expected.to belong_to(:user) }
    end
  end

end
