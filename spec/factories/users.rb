FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "#{Faker::Internet.email}#{n}" }
    password_digest { Faker::Internet.password }
    name { Faker::Internet.username }
  end
end
