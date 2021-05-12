FactoryBot.define do
  factory :guest do
    association :user, factory: :user
    association :party, factory: :party
  end
end