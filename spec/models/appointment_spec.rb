require "rails_helper"

RSpec.describe Appointment do
  subject(:appointment) { create(:appointment) }

  describe "validations" do
    it { expect(appointment).to validate_presence_of(:start_time) }
    it { expect(appointment).to validate_presence_of(:price) }
    it { expect(appointment).to validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
    it { expect(appointment.start_time).to be_a(Time) }
    it { expect(appointment.start_time).to be >= Time.zone.today }
  end
end
