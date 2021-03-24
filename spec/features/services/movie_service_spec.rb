require "rails_helper"

RSpec.describe 'MovieService' do
  describe "#get_data(url)" do
    it "can return JSON from an API endpoint" do
      movie_service_data = MovieService.new
      url = 'https://api.themoviedb.org/3/discover/movie?api_key=0ac776d1375798ed11d6d31668dc9946&language=en-US&sort_by=vote_average.desc&include_adult=false&include_video=false&page=1'
      # movie_service_data.all_movies_page_count
      expect(movie_service_data.get_data(url).count).to eq(4)
      expect(movie_service_data.get_data(url).keys).to eq([:page, :results, :total_pages, :total_results])
      expect(movie_service_data.get_data(url).class).to eq(Hash)
    end
  end

  describe "#movies_by_vote_average" do
    it "returns the top 40 movie title/tmdb_ids" do
      movie_service_data = MovieService.new
      results = movie_service_data.movies_by_vote_average
      
      expect(results.first[0]).to eq("Gabriel's Inferno Part II")
      expect(results.first[1]).to eq(8.8)
      expect(results.count).to eq(40)
    end
  end

  describe "#movie_search" do
    it "returns 40 movie title/tmdb_ids that match a search query" do
      movie_service = MovieService.new
      # movie_service_data.movie_search
      search_results = movie_service.movie_search("phoenix")

      expect(search_results.count).to eq(34)
      expect(search_results.first.class).to eq(Array)
      expect(search_results.first).to eq( ["Dark Phoenix", 320288])
      expect(search_results.class).to eq(Hash)
    end
  end

  describe "#results_page_count" do
    it "returns an integer from JSON data regarding number of pages of results" do
      movie_service = MovieService.new
      url = 'https://api.themoviedb.org/3/discover/movie?api_key=0ac776d1375798ed11d6d31668dc9946&language=en-US&sort_by=vote_average.desc&include_adult=false&include_video=false&page=1'
      url_2 = 'https://api.themoviedb.org/3/search/movie?api_key=cc1b7a1d937de5062ee5336bdb03e44d&language=en-US&query=phoenix&include_adult=false'

      expect(movie_service.results_page_count(url)).to eq(500)
      expect(movie_service.results_page_count(url_2)).to eq(8)
    end
  end
end
