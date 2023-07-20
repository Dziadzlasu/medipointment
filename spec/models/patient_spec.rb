require "rails_helper"

RSpec.describe Patient do
  subject(:patient) { create(:patient) }

  describe "validations" do
    it { expect(patient).to validate_presence_of(:first_name) }
    it { expect(patient).to validate_presence_of(:last_name) }
    it { expect(patient).to validate_presence_of(:pesel) }
    it { expect(patient).to validate_presence_of(:city) }
    it { expect(patient).to validate_presence_of(:date_of_birth) }

    it { expect(patient).to validate_uniqueness_of(:pesel).case_insensitive }

    it { expect(patient).to validate_length_of(:first_name).is_at_least(2) }
    it { expect(patient).to validate_length_of(:last_name).is_at_least(2) }
    it { expect(patient).to validate_length_of(:city).is_at_least(3) }
    it { expect(patient).to validate_length_of(:pesel).is_equal_to(11) }

    it { expect(patient.date_of_birth).to be > 120.years.ago }
    it { expect(patient.date_of_birth).to be <= Time.zone.today }
  end

  describe "associations" do
    it { expect(patient).to have_many(:appointments).dependent(:destroy) }
    it { expect(patient).to have_many(:physicians).through(:appointments) }
  end
end
