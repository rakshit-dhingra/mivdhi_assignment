class Booking < ApplicationRecord
  belongs_to :coach

  validates :time_slot, presence: true
  # validate :time_slot_must_be_available

  private

  # def time_slot_must_be_available
  #   unless coach.coach_availabilities.any? do |availability|
  #            availability_start = availability.available_at.in_time_zone(availability.time_zone).change(year: 2000, month: 1, day: 1)
  #            availability_end = availability.available_until.in_time_zone(availability.time_zone).change(year: 2000, month: 1, day: 1)
  #            time_only = time_slot.change(year: 2000, month: 1, day: 1)

  #            time_only.between?(availability_start, availability_end)
  #          end
  #     errors.add(:time_slot, 'is not within coach availability')
  #   end
  # end
end
