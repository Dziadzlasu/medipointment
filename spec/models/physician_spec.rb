require "rails_helper"

RSpec.describe Physician do
  subject(:physician) { create(:physician) }

  describe "validations" do
    it { expect(physician).to validate_presence_of(:first_name) }
    it { expect(physician).to validate_presence_of(:last_name) }
    it { expect(physician).to validate_presence_of(:specialization) }
  end

  describe "associations" do
    it { expect(physician).to have_many(:appointments).dependent(:destroy) }
    it { expect(physician).to have_many(:patients).through(:appointments) }
  end
end
