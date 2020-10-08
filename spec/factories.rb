FactoryBot.define do

  factory :user do
    email { Faker::Internet.email }
    password { "password" }
  end

  factory :friendship do
    user { nil }
    user { nil }
  end
end
