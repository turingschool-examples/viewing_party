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
  end
  it "returns an openstruct of movie_information" do
    VCR.use_cassette('movie_info') do
      result = MovieFacade.movie_information(550)
      first_result = result.first

      expect(result.class).to eq(Array)
      expect(first_result.class).to eq(OpenStruct)
      expect(first_result.id).to eq(550)
    end
  end
end
