require 'rails_helper'

RSpec.describe 'Movie Data Base Facade' do
  it "returns movie data", :vcr do
    movies = MovieDataBaseFacade.top_rated_movies

    expect(movies).to be_an(Array)
    expect(movies[0]).to be_a(Movie)
    expect(movies[0].title).to be_a(String)
  end
end
