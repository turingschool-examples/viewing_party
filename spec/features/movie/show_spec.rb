require 'rails_helper'

RSpec.describe 'movie show page' do
  before :each do
    stub_request(:get, "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['MOVIE_API']}").
    to_return(status: 200, body: "{\"results\": [{\"id\": 164558,\"original_title\": \"One Direction: This Is Us\",\"original_language\": \"en\",\"title\": \"One Direction: This Is Us\"}]}")
    # allow(Faraday).to receive(:get).and_return("{\"results\": [{\"id\": 164558,\"original_title\": \"One Direction: This Is Us\",\"original_language\": \"en\",\"title\": \"One Direction: This Is Us\"}]}")
  end
  it 'can get to new party page' do
    res = MovieService.new.movies
    id = res[:results][0][:id]

    visit "/movies/#{id}"

    expect(page).to  have_button('Add Viewing Party for Movie')

    click_on 'Add Viewing Party for Movie'

    expect(current_path).to  eq('/viewing_party/new')
  end
end