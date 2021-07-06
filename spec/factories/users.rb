FactoryBot.define do
  factory :mock_user, class: User do
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password } 
  end
end
