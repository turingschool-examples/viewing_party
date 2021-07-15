FactoryBot.define do
  factory :movie_party do
    user { create(:user) }
    movie_title { Faker::Movie.title }
    date_time { DateTime.new(2021,2,3,4,5,6) }
    runtime { 120 }
  end
end
