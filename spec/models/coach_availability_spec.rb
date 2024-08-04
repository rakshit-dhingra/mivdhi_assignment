# spec/models/coach_availability_spec.rb
require 'rails_helper'

RSpec.describe CoachAvailability, type: :model do
  # FactoryBot setup (ensure you have a factory for Coach and CoachAvailability)
  let(:coach) { create(:coach) }
  let(:coach_availability) { build(:coach_availability, coach: coach) }

  # Validation tests
  describe 'validations' do
    it { should validate_presence_of(:day_of_week) }
    it { should validate_presence_of(:available_at) }
    it { should validate_presence_of(:available_until) }

    it 'is valid with valid attributes' do
      expect(coach_availability).to be_valid
    end

    it 'is not valid without a day_of_week' do
      coach_availability.day_of_week = nil
      expect(coach_availability).not_to be_valid
    end

    it 'is not valid without an available_at time' do
      coach_availability.available_at = nil
      expect(coach_availability).not_to be_valid
    end

    it 'is not valid without an available_until time' do
      coach_availability.available_until = nil
      expect(coach_availability).not_to be_valid
    end
  end

  # Associations tests
  describe 'associations' do
    it { should belong_to(:coach) }
  end
end
