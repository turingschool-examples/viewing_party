require 'rails_helper'

RSpec.describe 'Movie Show Page' do
  before :each do
    response_1 = File.open("spec/fixtures/movie_details_part_one.json")
    response_2 = File.open("spec/fixtures/movie_details_part_two.json")
    response_3 = File.open("spec/fixtures/movie_details_part_three.json")
    movie_id = 278
    stub_request(:get, "https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{ENV['api_key']}").
      to_return(status: 200, body: response_1)

    stub_request(:get, "https://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=#{ENV['api_key']}").
      to_return(status: 200, body: response_2)

    stub_request(:get, "https://api.themoviedb.org/3/movie/#{movie_id}/reviews?api_key=#{ENV['api_key']}").
      to_return(status: 200, body: response_3)

    visit '/movies/278'
  end



  xit 'shows the title, vote average, summary, genres, and runtime of the given movie' do
      expect(page).to have_content('The Shawshank Redemption')
  end

  xit 'shows cast information' do
  end

  xit 'shows reviewer data' do
  end
end
