require 'rails_helper'

RSpec.describe Report, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:reason) }
    # it { is_expected.to validate_presence_of(:screenshot) }
    # it { is_expected.to validate_presence_of(:link) }
  end

end
