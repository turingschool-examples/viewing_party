require 'rails_helper'
require 'ostruct'

RSpec.describe MovieFacade do
  describe "Happy path" do
    VCR.use_cassette('movie_search') do
      it "calls the Movie search and gets data" do
        title = 'Phoenix'
        result = MovieFacade.search(title, 20)

        expect(result.class).to eq(Array)
        expect(result[0].class).to eq(OpenStruct)
      end
    end
  end
end
