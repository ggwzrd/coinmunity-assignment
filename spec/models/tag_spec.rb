require 'rails_helper'

RSpec.describe Tag, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe "association with post" do
      it { is_expected.to have_and_belong_to_many(:posts) }
  end

end
