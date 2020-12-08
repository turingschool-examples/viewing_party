require 'rails_helper'

describe 'Movies Service' do
  it 'can return movie search', :vcr do
    query = 'batman'
    response = MovieService.movies_search(1, 'search/movie', query)
    expect(response).to be_an(Array)
    expect(response[0]).to be_a(Hash)

    expect(response[0]).to have_key(:id)
    expect(response[0][:id]).to be_a(Integer)

    expect(response[0]).to have_key(:title)
    expect(response[0][:title]).to be_an(String)

    expect(response[0]).to have_key(:vote_average)
    expect(response[0][:vote_average]).to be_an(Float)

  end

    it 'can search top movies without a query', :vcr do
    response = MovieService.movies_search(1, 'movie/top_rated')
    expect(response).to be_an(Array)
    expect(response[0]).to be_a(Hash)

    expect(response[0]).to have_key(:id)
    expect(response[0][:id]).to be_a(Integer)

    expect(response[0]).to have_key(:title)
    expect(response[0][:title]).to be_an(String)

    expect(response[0]).to have_key(:vote_average)
    expect(response[0][:vote_average]).to be_an(Float)
  end

  it 'can find movie details', :vcr do
    response = MovieService.movie_details(155)
    expect(response).to be_a(Hash)

    expect(response).to have_key(:id)
    expect(response[:id]).to be_a(Integer)

    expect(response).to have_key(:title)
    expect(response[:title]).to be_an(String)

    expect(response).to have_key(:vote_average)
    expect(response[:vote_average]).to be_an(Float)

    expect(response).to have_key(:credits)
    expect(response[:credits]).to be_an(Hash)

    expect(response).to have_key(:reviews)
    expect(response[:reviews]).to be_an(Hash)

    expect(response).to have_key(:genres)
    expect(response[:genres]).to be_an(Array)

    expect(response).to have_key(:overview)
    expect(response[:overview]).to be_an(String)

    expect(response).to have_key(:runtime)
    expect(response[:runtime]).to be_an(Integer)

  end
end
