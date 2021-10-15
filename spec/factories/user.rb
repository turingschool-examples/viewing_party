FactoryBot.define do
  factory :mock_user, class: User do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name}
  end
end
