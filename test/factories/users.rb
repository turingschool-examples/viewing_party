FactoryBot.define do
  factory :user do
    email { "MyString" }
    username { "MyString" }
    password_digest { "MyString" }
    host { false }
  end
end
