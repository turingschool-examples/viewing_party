require 'rails_helper'

RSpec.describe MoviesFacade do
  it 'processes movie data and returns Movie objects' do
    movies = MoviesFacade.movies

    # We likely need to refactor this test as our 
    # API testing (mocking/stubbing) expands 

    expect(movies.count).to eq(20)
    
    movies.each do |movie|
      expect(movie).to be_an_instance_of(Movie)
    end
  end
end
