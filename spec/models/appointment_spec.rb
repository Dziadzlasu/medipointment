require 'rails_helper'

RSpec.describe Appointment, type: :model do
  subject { create(:appointment)}
  describe "validations" do
    it { expect(subject).to validate_presence_of(:start_time) }
    it { expect(subject).to validate_presence_of(:patient_id) }
    it { expect(subject).to validate_presence_of(:physician_id) }
    it { expect(subject).to validate_presence_of(:price) }
    it { expect(subject).to validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
    it { expect(subject.start_time).to be_kind_of(Time) }
    it { expect(subject.start_time).to be >= Date.today }
  end
end
