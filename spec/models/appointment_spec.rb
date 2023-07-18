require 'rails_helper'

RSpec.describe Appointment, type: :model do
  subject { create(:appointment, date: Date.today + 1.day) }
  describe "validations" do
    it { expect(subject).to validate_presence_of(:date) }
    it { expect(subject).to validate_presence_of(:time) }
    it { expect(subject).to validate_presence_of(:patient_id) }
    it { expect(subject).to validate_presence_of(:physician_id) }
    it { expect(subject.date).to be_a(Date) && be_equal_or_greater_than(Date.today) }
  end
end
