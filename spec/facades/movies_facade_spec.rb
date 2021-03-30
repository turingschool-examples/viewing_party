require 'rails_helper'
require 'ostruct'

RSpec.describe MovieFacade do
  describe "Happy path" do
    VCR.use_cassette('movie_search') do
      it "calls the Movie search and gets data" do
        title = 'Phoenix'
        limit = 20
        result = MovieFacade.search(title, limit)

        expect(result.class).to eq(Array)
        expect(result[0].class).to eq(OpenStruct)
        expect(result.count).to eq(limit)
      end
    end
    VCR.use_cassette('top_forty') do
      it "calls the Movie top_forty and gets data" do
        limit = (40)
        result = MovieFacade.top_movies(limit)

        expect(result.class).to eq(Array)
        expect(result[0].class).to eq(OpenStruct)
        expect(result.count).to eq(40)
      end
    end
  end
end
