require 'rails_helper'
RSpec.describe 'can find certain movies based off of criteria' do
  before :each do
    visit "/discover"
  end

  it 'search for a movie through the movie search bar' do
    expect(page).to have_field(:search)
  end

  it 'can click the link to go to top rated movies' do
    expect(page).to have_button("Find Top Rated Movies")

    json_response1 = File.read('spec/fixtures/popular_movies1.json')

    stub_request(:get, "https://api.themoviedb.org/3/movie/popular?api_key=#{ENV['movie_key']}&page=1").
    with(
      headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v1.7.0'
        }).
        to_return(status: 200, body: json_response1, headers: {})

        json_response2 = File.read('spec/fixtures/popular_movies2.json')

        stub_request(:get, "https://api.themoviedb.org/3/movie/popular?api_key=#{ENV['movie_key']}&page=2").
        with(
          headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent'=>'Faraday v1.7.0'
            }).
            to_return(status: 200, body: json_response2, headers: {})

            click_button("Find Top Rated Movies")

            expect(current_path).to eq('/movies')
          end
        end
