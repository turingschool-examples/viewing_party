FactoryBot.define do
  factory :mock_party_guest, class: PartyGuest do
    party_id { nil }
    guest_id { nil }
  end
end
