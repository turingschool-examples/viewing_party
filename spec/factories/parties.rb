FactoryBot.define do
  factory :mock_party, class: Party do
    movie_api_id { nil }
    duration { Faker::Number.between(from: 0.0, to: 100.0) }
    start_time_day { "2021-07-06 12:00 PM" }
    host_id { nil } 
  end
end
