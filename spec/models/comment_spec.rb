require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:text) }
  end

  describe "associations" do
    describe "association with user" do
      it { is_expected.to belong_to(:user) }
    end

    describe "association with post" do
      it { is_expected.to belong_to(:post) }
    end
  end
end
