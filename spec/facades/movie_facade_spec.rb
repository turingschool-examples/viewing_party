require 'rails_helper'

describe 'MovieFacade' do
  it 'returns an array popular movies', :vcr do
    facade = MovieFacade.popular_movies
    expect(facade).to be_an Array
    expect(facade.first).to be_a MovieInfo
  end
  it 'returns search results', :vcr do
    facade = MovieFacade.search_results('Mortal Kombat')
    expect(facade).to be_an Array
    expect(facade.first).to be_a MovieInfo
  end
  it 'returns info on a specific movie', :vcr do
    facade = MovieFacade.movie_details('460465')
    expect(facade).to be_a MovieInfo
  end
  it 'returns cast details', :vcr do
    facade = MovieFacade.movie_cast_details('460465')
    expect(facade).to be_an Array
    expect(facade.first).to be_a MovieCast
  end
  it 'returns review details', :vcr do
    facade = MovieFacade.movie_review_details('460465')
    expect(facade).to be_an Array
    expect(facade.first).to be_a MovieReview
  end
  it 'returns buy providers', :vcr do
    facade = MovieFacade.buy_provider('1891')
    expect(facade).to be_an Array
    expect(facade.first).to be_a BuyProvider
  end
  it 'returns rent providers', :vcr do
    facade = MovieFacade.rent_provider('1891')
    expect(facade).to be_an Array
    expect(facade.first).to be_a RentProvider
  end
  it 'returns streaming providers', :vcr do
    facade = MovieFacade.streaming_provider('1891')
    expect(facade).to be_an Array
    expect(facade.first).to be_a StreamingProvider
  end
end
