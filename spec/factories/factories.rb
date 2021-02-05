FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
    name { Faker::Name.name }
  end
end
