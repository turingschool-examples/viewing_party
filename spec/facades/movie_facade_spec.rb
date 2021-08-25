require 'rails_helper'

RSpec.describe MovieFacade do
  before :each do

  end

  it 'can verify that it exists' do
    movie_facade = MovieFacade.new

    expect(movie_facade).to be_an_instance_of(MovieFacade)
    expect(movie_facade.service).to be_an_instance_of(MovieService)
  end

  it 'can create a movie' do
    movie_facade = MovieFacade.new
    movie = movie_facade.create_movie('550')

    expect(movie).to be_an_instance_of(Movie)
    expect(movie.title).to eq("Fight Club")
  end

  it 'can create 40 popular movies' do
    movie_facade = MovieFacade.new

    expect(movie_facade.top_movies.count).to eq(40)
  end
end
