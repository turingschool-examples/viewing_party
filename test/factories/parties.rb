FactoryBot.define do
  factory :party do
    title { "MyString" }
    api_id { 1 }
    runtime { "MyString" }
    datetime_of_party { "2020-10-12 18:40:47" }
    user { nil }
  end
end
