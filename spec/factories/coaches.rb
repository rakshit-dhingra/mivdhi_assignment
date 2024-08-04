# spec/factories/coaches.rb
FactoryBot.define do
  factory :coach do
    name { "John Doe" }
    timezone { "UTC" }
  end
end