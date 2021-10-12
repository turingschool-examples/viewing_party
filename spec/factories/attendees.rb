FactoryBot.define do
  factory :mock_attendee, class: Attendee do
    viewing_party_id { nil }
    attendee_id { nil }
    status { "host" }
  end
end
