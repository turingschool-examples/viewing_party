FactoryBot.define do
  factory :friend do
    association :user, factory: :user
    association :friend, factory: :user
    
    status { rand(0..2) }
  end
end