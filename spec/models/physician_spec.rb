require 'rails_helper'

RSpec.describe Physician, type: :model do
  subject { create(:physician) }

  describe 'validations' do
    it { expect(subject).to validate_presence_of(:first_name) }
    it { expect(subject).to validate_presence_of(:last_name) }
    it { expect(subject).to validate_presence_of(:specialization) }
  end

  describe 'associations' do
    it { expect(subject).to have_many(:appointments).dependent(:destroy) }
    it { expect(subject).to have_many(:patients).through(:appointments) }
  end
end
