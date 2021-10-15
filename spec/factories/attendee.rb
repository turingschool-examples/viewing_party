FactoryBot.define do
  factory :mock_attendee, class: Attendee do
    party_id { nil }
    user_id { nil }
    status { "host" }
  end
end
