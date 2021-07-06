FactoryBot.define do
  factory :mock_friendship, class: Friendship do
    user_id { nil }
    friend_id { nil }
  end
end
