class Booking < ApplicationRecord
  belongs_to :coach

  validate :time_slot_must_be_available
  validates :time_slot, :day_of_week, :timezone, presence: true

  private

  def time_slot_must_be_available
    return errors.add(:time_slot, 'must be present') unless self.time_slot.present?
    unless coach.coach_availabilities.where(day_of_week: self.day_of_week).any? do |availability|
      availability_start = availability.available_at.change(year: 2000, month: 1, day: 1)
      availability_end = availability.available_until.change(year: 2000, month: 1, day: 1)
      availability_end += 1.day if availability_end < availability_start
      time_only = time_slot.change(year: 2000, month: 1, day: 1)
      time_only += 1.day if time_only < availability_start

      time_only.between?(availability_start, availability_end)
    end
      errors.add(:time_slot, 'is not within coach availability')
    end
  end
end
