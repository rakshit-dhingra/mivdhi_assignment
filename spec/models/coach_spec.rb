# spec/models/coach_spec.rb
require 'rails_helper'

RSpec.describe Coach, type: :model do
  # FactoryBot setup (ensure you have a factory for Coach)
  let(:coach) { create(:coach) }

  # Validation tests
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:timezone) }
  end

  # Associations tests
  describe 'associations' do
    it { should have_many(:coach_availabilities).dependent(:destroy) }
    it { should have_many(:bookings).dependent(:destroy) }
  end

  # Custom tests
  describe 'custom behavior' do
    it 'should create a coach with valid attributes' do
      expect(coach).to be_valid
      expect(coach.name).to be_present
      expect(coach.timezone).to be_present
    end
  end
end
