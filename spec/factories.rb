FactoryBot.define do
  factory :user do
    sequence(:username) {|n| "Username: #{n}" }
    sequence(:email) {|n| "email#{n}@email.com"}
    sequence(:password) {|n| "123whollysmokes"}
    sequence(:password_confirmation) {|n| "123whollysmokes"}
  end
end
