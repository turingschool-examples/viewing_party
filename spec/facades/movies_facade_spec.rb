require 'rails_helper'

RSpec.describe "Movie facade" do
  describe "(happy path)" do
    it "returns data from API call", :vcr do
      VCR.use_cassette ("spec/fixtures/vcr_cassettes/movie_search_results") do
        # exercise our code by calling facade
        movie_facade = MoviesFacade.get_top_movies
  
        # expect that we get a movie PORO
        expect(movie_facade).to be_an(Array)
        expect(movie_facade[0]).to be_a(LocalMovie)
      end
    end
  end
end