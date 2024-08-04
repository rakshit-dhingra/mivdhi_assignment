FactoryBot.define do
  factory :coach_availability do
    association :coach
    day_of_week { 'Monday' }
    available_at { Time.zone.parse('10:00') }
    available_until { Time.zone.parse('12:00') }
    booked { false }
  end
end