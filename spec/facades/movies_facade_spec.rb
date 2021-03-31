require 'rails_helper'
require 'ostruct'

RSpec.describe MovieFacade do
  describe "Happy path" do
    it "calls the Movie search and gets data" do
      VCR.use_cassette('movie_search') do
        title = 'Phoenix'
        limit = 20
        result = MovieFacade.search(title, limit)

        expect(result.class).to eq(Array)
        expect(result[0].class).to eq(OpenStruct)
        expect(result.count).to eq(limit)
      end
    end
    it "calls the Movie top_forty and gets data" do
      VCR.use_cassette('top_forty') do
        limit = (40)
        result = MovieFacade.top_movies(limit)

        expect(result.class).to eq(Array)
        expect(result[0].class).to eq(OpenStruct)
        expect(result.count).to eq(40)
      end
    end
    it "returns an openstruct of movie_information" do
      VCR.use_cassette('movie_info') do
        result = MovieFacade.movie_information(550)

        expect(result.class).to eq(OpenStruct)
        expect(result.api_id).to eq(550)
        expect(result.title).to eq("Fight Club")
        expect(result.vote_average).to eq(8.4)
        expect(result.runtime).to eq(139)
        expect(result.genres).to eq(["Drama"])
        expect(result.summary.class).to eq(String)
        expect(result.cast.count).to eq(10)
        expect(result.reviews.class).to eq(Hash)
      end
    end
    it "creates a movie in the database if it does not already exist" do
      result = MovieFacade.create_movie(550)

      expect(result.class).to eq(Movie)
      result = Movie.where(api_id: 550)

      expect(result.count).to eq(1)
    end
  end
  describe "sad path" do
    it "can return an empty array if no movies match the api_id " do
      VCR.use_cassette('movie_info_sad_path') do
        result = MovieFacade.movie_information(1)

        expect(result.class).to eq(Array)
        expect(result.empty?).to eq(true)
      end
    end
  end
end
