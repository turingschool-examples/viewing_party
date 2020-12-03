FactoryBot.define do
  factory :user do
    sequence(:username) {|n| "Username: #{n}" }
    sequence(:email) {|n| "email#{n}@email.com"}
    sequence(:password) {|n| "123whollysmokes"}
    sequence(:password_confirmation) {|n| "123whollysmokes"}
  end

  factory :movie do
    sequence(:title) {|n| "The Great Beyond #{n}"}
    sequence(:duration) {|n| 120}
    sequence(:api_id) {|n| 112 + n}
  end

  factory :viewing do
    movie
    sequence(:duration) {|n| movie.duration + n}
    sequence(:date) {|n| Time.strftime('%m-%d-%Y') + n}
    sequence(:start_time) {|n| Time.now + n}
  end

  factory :guest do
    user
    viewing
  end

end
