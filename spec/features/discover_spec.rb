require 'rails_helper'

RSpec.describe "discover page" do
  before :each do
    @user = User.create!(email: "fav@email.com", username: "bestuser", password: "veryhardpassword")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit discover_path
  end

  xit "should include button to discover top 40 movies" do
    click_button("Find Top 20 Rated Movies")

    expect(current_path).to eq("/movies")
  end

  xit "should allow user to search by movie title" do
    fill_in "Search by movie title", with: "Just Mercy"

    click_button("Find Movies")

    expect(current_path).to eq("/movies?q=just+mercy")
  end

  it 'allows users to search for most popular movies' do
    json_response = File.read("spec/fixtures/moviedb_popular.json")
    stub_request(:get, "https://api.themoviedb.org/3/movie/popular").
     with(
       headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Authorization'=> "Bearer #{ENV['moviedb_bearer_token']}",
      'Language'=>'en-US',
      'User-Agent'=>'Faraday v1.4.1'
       }).to_return(status: 200, body: json_response)

    visit movies_path

    expect(current_path).to eq("/movies")
    expect(page.status_code).to eq(200)
    expect(page).to have_content("Tom Clancy's Without Remorse")
    expect(page).to have_content("vote_average: 7.3")
  end
end
