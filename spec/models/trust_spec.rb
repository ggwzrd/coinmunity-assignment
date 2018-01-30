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

end
