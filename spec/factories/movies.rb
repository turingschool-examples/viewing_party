FactoryBot.define do
  factory :movie do
    sequence(:title) { |n| "#{Faker::Movie.title}#{n}" }
    runtime { rand(90..120) }
    avg_score { rand(0.5..5.0).round(1) }
  end
end