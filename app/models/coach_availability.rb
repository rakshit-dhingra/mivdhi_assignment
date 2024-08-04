class CoachAvailability < ApplicationRecord
  belongs_to :coach
  validates :day_of_week, :available_at, :available_until, presence: true
end
