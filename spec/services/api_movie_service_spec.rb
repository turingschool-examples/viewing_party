require "rails_helper"
require "ostruct"

RSpec.describe ApiMovieService do
  describe "::get_data(url)" do
    it "can return JSON from an API endpoint" do
      url = ENV['API_TEST_COUNT_URL']

      expect(ApiMovieService.get_data(url).count).to eq(4)
      expect(ApiMovieService.get_data(url).keys).to eq([:page, :results, :total_pages, :total_results])
      expect(ApiMovieService.get_data(url).class).to eq(Hash)
    end
  end
  describe "::movie_info_cast" do
    it "returns an the actor and role they played in the movie" do
      VCR.use_cassette('movie_cast_service') do
        movie_cast_info = ApiMovieService.movie_info_cast(550)
        expect(movie_cast_info.keys.first).to eq("Edward Norton")
        expect(movie_cast_info.keys[-1]).to eq("David Andrews")
        expect(movie_cast_info.count).to eq(10)
      end
    end
  end
  describe "::movie_info_reviews" do
    it "should return a hash with the review count and review and authors when there are more than 1 pages of reviews" do
      VCR.use_cassette('movie_reivews') do
        movie_review_info = ApiMovieService.movie_info_reviews(558)
        expect(movie_review_info.count).to eq(31)
      end
    end
    it "should return a hash with the review count and review and authors when there is only 1 page of reviews" do
      VCR.use_cassette('movie_reivews_550') do
        movie_review_info = ApiMovieService.movie_info_reviews(550)
        expect(movie_review_info.count).to eq(6)
      end
    end
  end
end
