class CoachAvailability < ApplicationRecord
  belongs_to :coach
  validates :day_of_week, :available_at, :available_until, presence: true

  def available_at_in_time_zone
    available_at.in_time_zone(time_zone)
  end

  def available_until_in_time_zone
    available_until.in_time_zone(time_zone)
  end
end
