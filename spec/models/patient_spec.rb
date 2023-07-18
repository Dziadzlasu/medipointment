require 'rails_helper'

RSpec.describe Patient, type: :model do
  subject { create(:patient) }

  describe 'validations' do
    it { expect(subject).to validate_presence_of(:first_name) }
    it { expect(subject).to validate_presence_of(:last_name) }
    it { expect(subject).to validate_presence_of(:pesel) }
    it { expect(subject).to validate_presence_of(:city) }
    it { expect(subject).to validate_presence_of(:date_of_birth) }

    it { expect(subject).to validate_uniqueness_of(:pesel).case_insensitive }

    it { expect(subject).to validate_length_of(:first_name).is_at_least(2) }
    it { expect(subject).to validate_length_of(:last_name).is_at_least(2) }
    it { expect(subject).to validate_length_of(:city).is_at_least(3) }
    it { expect(subject).to validate_length_of(:pesel).is_equal_to(11) }

    it { expect(subject.date_of_birth).to be > 120.years.ago }
    it { expect(subject.date_of_birth).to be <= Date.today }
  end

  describe 'associations' do
    it { expect(subject).to have_many(:appointments).dependent(:destroy) }
    it { expect(subject).to have_many(:physicians).through(:appointments) }
  end
end
