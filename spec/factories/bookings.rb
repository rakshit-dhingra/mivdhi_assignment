FactoryBot.define do
  factory :booking do
    association :coach
    time_slot { Time.zone.parse('11:00') }
    day_of_week { 'Monday' }
    timezone { 'UTC' }
  end
end