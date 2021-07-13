require 'rails_helper'

RSpec.describe MovieDetails do 
  describe '::instantiation' do
    it 'exists and has attributes' do
      service = MovieService.new
      cruella = VCR.use_cassette("movie_details_by_id") do
        MovieFacade.movie_details_by_id(337404)
      end 
     

      expect(cruella).to be_a MovieDetails
      expect(cruella.title).to eq("Cruella")
      expect(cruella.vote_average).to eq(8.4)
      expect(cruella.runtime).to eq(134)
      expect(cruella.genres.size).to eq(2)
      expect(cruella.overview.size).to eq(633)
      expect(cruella.reviews.size).to eq(3)
      expect(cruella.id).to eq(337404)
    end
  end
end 