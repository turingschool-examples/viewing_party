FactoryBot.define do
  factory :user do
    sequence(:username) {|n| "Username: #{n}" }
    sequence(:email) {|n| "email#{n}@email.com"}
    sequence(:password) {|n| "123whollysmokes"}
    sequence(:password_confirmation) {|n| "123whollysmokes"}
  end

  factory :movie do
    sequence(:title) {|n| "The Great Beyond #{n}"}
    sequence(:duration_of_movie) {|n| 120}
    sequence(:api_id) {|n| 112 + n}
  end

  factory :viewing do
    movie
    sequence(:duration_of_party) {|n| movie.duration_of_movie + n}
    sequence(:start_time) {|n| Time.now.strftime('%I:%M %P')}
  end

  factory :guest do
    user
    viewing
  end

end
