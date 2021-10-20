require 'rails_helper'

RSpec.describe 'Movie Info Poros' do
  describe '::instantiation' do
    it 'exists and has attributes' do
      service = MovieService.new

      cruella = VCR.use_cassette("movie_info_by_id") do
        MovieFacade.movie_info_by_id(337404)
      end

      expect(cruella).to be_a MovieInfo
      expect(cruella.title).to eq("Cruella")
      expect(cruella.vote_average).to eq(8.3)
      expect(cruella.runtime).to eq(134)
      expect(cruella.genres.size).to eq(2)
      expect(cruella.overview.size).to eq(633)
      expect(cruella.reviews.size).to eq(6)
      expect(cruella.id).to eq(337404)
      expect(cruella.poster).to eq('/wToO8opxkGwKgSfJ1JK8tGvkG6U.jpg')
    end

    it 'can display a poster', :vcr do
      service = MovieService.new

      cruella = VCR.use_cassette('movie_info_by_id') do
        MovieFacade.movie_info_by_id(337404)
      end

      expect(cruella.poster_url).to eq ('https://image.tmdb.org/t/p/w300/wToO8opxkGwKgSfJ1JK8tGvkG6U.jpg')
    end
  end
end
