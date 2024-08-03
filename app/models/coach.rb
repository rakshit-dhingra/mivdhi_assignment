class Coach < ApplicationRecord
  has_many :coach_availabilities, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :timezone, presence: true
end
