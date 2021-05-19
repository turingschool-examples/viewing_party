require 'rails_helper'

RSpec.describe 'MovieFacade' do
  it 'returns an array of Film objects for title search' do
    stub_search_by_title
    title_search = MovieFacade.search_by_title('Hamilton')

    expect(title_search).to be_an(Array)
    expect(title_search.first).to be_a(Film)
  end

  it 'returns array of Film objects for top 40 search' do
    VCR.use_cassette('top40_movies') do

      top_rated_search = MovieFacade.top40

      expect(top_rated_search).to be_an(Array)
      expect(top_rated_search.first).to be_a(Film)
    end
  end

  it 'returns one Film object for fetch movie details' do
    VCR.use_cassette('hamilton_details') do

      movie = MovieFacade.fetch_movie_details('556574')

      expect(movie).to be_a(Film)
    end
  end

  it 'returns an array of Cast objects for one movie' do
    VCR.use_cassette('hamilton_cast') do

      hamilton_cast = MovieFacade.fetch_movie_cast('556574')

      expect(hamilton_cast).to be_an(Array)
      expect(hamilton_cast.first).to be_a(Cast)
    end
  end

  it 'returns an array of Review objects for one movie' do
    VCR.use_cassette('hamilton_reviews') do

      hamilton_reviews = MovieFacade.fetch_movie_reviews('556574')

      expect(hamilton_reviews).to be_an(Array)
      expect(hamilton_reviews.first).to be_a(Review)
    end
  end
end
