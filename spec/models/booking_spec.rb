# spec/models/booking_spec.rb
require 'rails_helper'

RSpec.describe Booking, type: :model do
  let(:coach) { create(:coach) }
  let!(:availability) do
    create(:coach_availability, 
           coach: coach, 
           day_of_week: 'Monday', 
           available_at: '10:00', 
           available_until: '12:00')
  end
  let(:valid_time_slot) { Time.zone.parse('11:00') }
  let(:invalid_time_slot) { Time.zone.parse('09:00') }

  subject do
    build(:booking, 
          coach: coach, 
          time_slot: valid_time_slot, 
          day_of_week: 'Monday', 
          timezone: 'UTC')
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:time_slot) }
    it { is_expected.to validate_presence_of(:day_of_week) }
    it { is_expected.to validate_presence_of(:timezone) }

    context 'when time slot is within coach availability' do
      it 'is valid' do
        expect(subject).to be_valid
      end
    end

    context 'when time slot is not within coach availability' do
      before { subject.time_slot = invalid_time_slot }

      it 'is not valid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:time_slot]).to include('is not within coach availability')
      end
    end

    context 'when day of week does not match coach availability' do
      before { subject.day_of_week = 'Tuesday' }

      it 'is not valid' do
        expect(subject).not_to be_valid
        expect(subject.errors[:time_slot]).to include('is not within coach availability')
      end
    end
  end
end
