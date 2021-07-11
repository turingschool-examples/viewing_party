require 'rails_helper'

RSpec.describe MovieDetails do 
  describe '::instantiation' do
    it 'exists and has attributes' do
      service = MovieService.new
      movie = VCR.use_cassette("tmdb_find_movie_by_movie_id") do
        service.find_by_id(337404)
      end
      
      cast = VCR.use_cassette("tmdb_find_cast_by_movie_id") do
        service.find_cast(337404)
      end
      
      reviews = VCR.use_cassette("tmdb_find_reviews") do
        service.find_reviews(337404)
      end
      
      cruella = MovieDetails.new(movie, cast, reviews)

      expect(cruella).to be_a MovieDetails
      expect(cruella.title).to eq("Cruella")
      expect(cruella.vote_average).to eq(8.5)
      expect(cruella.runtime).to eq(134)
      expect(cruella.genres.size).to eq(2)
      expect(cruella.overview.size).to eq(633)
      expect(cruella.reviews.size).to eq(3)
      expect(cruella.id).to eq(337404)
    end
  end
end 