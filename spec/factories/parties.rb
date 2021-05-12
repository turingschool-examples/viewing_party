FactoryBot.define do
  factory :party do
    association :host, factory: :user
    association :movie, factory: :movie

    date { Faker::Date.forward(days: 30) }
    start_time { '6 pm' }
  end
end