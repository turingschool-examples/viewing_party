require "rails_helper"

RSpec.describe 'MovieService' do
  it "exists" do
    movie_service_data = MovieService.new
    # movie_service_data.all_movies_page_count
    movie_service_data.movie_search
  end

  describe "#movie_search" do
    it "returns 40 movie title/tmdb ids that match a search query" do
      movie_service = MovieService.new
      # movie_service_data.movie_search
      search_results = movie_service.movie_search("phoenix")

      expect(search_results.count).to eq(34)
      expect(search_results.first.class).to eq(Array)
      expect(search_results.first).to eq( ["Dark Phoenix", 320288])
      expect(search_results.class).to eq(Hash)
    end
  end
end
