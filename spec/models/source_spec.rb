require 'rails_helper'

RSpec.describe Source, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:authenticity) }
    it { is_expected.to validate_presence_of(:logo) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:domain) }
    it { is_expected.to validate_presence_of(:secure_connection) }
    it { is_expected.to validate_presence_of(:verified) }
  end
  
end
