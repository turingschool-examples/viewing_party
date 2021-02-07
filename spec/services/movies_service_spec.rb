require 'rails_helper'

describe MoviesService do
  it 'exists' do
    @service = MoviesService.new
    expect(@service).to be_an_instance_of(MoviesService)
  end

  it 'retrieves reviews', :vcr do
    @reviews = MoviesService.retrieve_reviews(8587)

    expect(@reviews.count).to eq(5)
  end

  it 'retrieves cast', :vcr do
    @cast = MoviesService.retrieve_cast(8587)

    expect(@cast.count).to eq(3)
  end

  it 'finds movie', :vcr do
    @movie = MoviesService.find_movie(8587)

    expect(@movie.count).to eq(25)
  end
end
