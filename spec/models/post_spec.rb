require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:link) }
    it { is_expected.to validate_presence_of(:images)}
    # it { is_expected.to validate_presence_of(:video)}
    it { is_expected.to validate_presence_of(:is_spam)}
    it { is_expected.to validate_length_of(:content).is_at_most(500) }
  end

end
