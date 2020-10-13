require 'rails_helper'

RSpec.describe MovieService do
  it "returns top rated movie data", :vcr do
    search = MovieService.top_rated_movies
    expect(search).to be_an(Array)
    movie_data = search.first

    expect(movie_data).to have_key :title
    expect(movie_data[:title]).to be_a(String)

    expect(movie_data).to have_key :vote_average
    expect(movie_data[:vote_average]).to be_a(Float)
  end

  # it "should have a successful response" do
  #   conn = MovieService.conn
  # end
end
