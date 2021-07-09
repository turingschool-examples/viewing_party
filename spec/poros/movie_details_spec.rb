require 'rails_helper'

RSpec.describe MovieDetails do 
  describe '::instantiation' do
    it 'exists and has attributes' do
      service = MovieService.new 
      movie = service.find_by_id(337404)
      cast = service.find_cast(337404)
      reviews = service.find_reviews(337404)
      cruella = MovieDetails.new(movie, cast, reviews)
      require 'pry'; binding.pry
      expect(cruella).to be_a MovieDetails
    end
  end
end 