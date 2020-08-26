FactoryBot.define do
  factory :user do
    email  { Faker::Internet.email }
    access_token { 12312487136487 }
    uid {4444444}
  end
end
