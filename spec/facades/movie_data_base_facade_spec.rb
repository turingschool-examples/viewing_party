require 'rails_helper'

RSpec.describe 'Movie Data Base Facade' do
  it "returns movie data", :vcr do
    movies = MovieDataBaseFacade.top_rated_movies

    expect(movies).to be_an(Array)
    expect(movies[0]).to be_a(Movie)
    expect(movies[0].title).to be_a(String)
  end

  it "returns searched movie_data", :vcr do
    keyword = 'Rush'
    movies = MovieDataBaseFacade.movies_search(keyword)

    expect(movies).to be_an(Array)
    expect(movies.first).to be_a(Movie)
    expect(movies.first.title).to be_a(String)
  end

  it "returns movie details", :vcr do
    movie_id = 278
    movie = MovieDataBaseFacade.movie_details(movie_id)

    expect(movie).to be_a(Movie)
    expect(movie.title).to be_a(String)
  end

  it "returns cast data", :vcr do
    movie_id = 278
    cast = MovieDataBaseFacade.movie_cast(movie_id)

    expect(cast).to be_an(Array)
    expect(cast.first).to be_a(CastMember)
    expect(cast.first.name).to be_a(String)
  end
end
