require 'rails_helper'

describe 'Movies Facade' do
  it 'returns movies in a search with optional query', :vcr do
    movies = MovieFacade.search('batman')
    expect(movies).to be_an(Array)
    expect(movies.size).to eq(40)
    expect(movies.first).to be_an_instance_of(Film)

    movies = MovieFacade.search()
    expect(movies).to be_an(Array)
    expect(movies.size).to eq(40)
    expect(movies.first).to be_an_instance_of(Film)
  end

  it 'can return details of a specific movie object', :vcr do
    movie = MovieFacade.details(155)
    expect(movie).to be_an_instance_of(Film)
    expect(movie.title).to be_an_instance_of(String)
    expect(movie.rating).to be_an_instance_of(Float)
    expect(movie.runtime_min).to be_an_instance_of(Integer)
    expect(movie.overview).to be_an_instance_of(String)
    expect(movie.api_movie_id).to be_an_instance_of(Integer)
    expect(movie.cast).to be_an_instance_of(Array)
    expect(movie.cast.first).to be_an_instance_of(Actor)
    expect(movie.reviews).to be_an_instance_of(Array)
    expect(movie.reviews.first).to be_an_instance_of(Review)
  end
end
