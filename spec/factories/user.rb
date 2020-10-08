FactoryBot.define do
  factory :user do
    email {Faker::User.email}
    password {Faker::User.password}
  end
end
