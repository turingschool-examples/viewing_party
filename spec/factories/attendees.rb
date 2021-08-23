FactoryBot.define do
  factory :attendee do
    watch_party { nil }
    user { nil }
    status { 1 }
  end
end
