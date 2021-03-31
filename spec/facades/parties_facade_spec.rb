require 'rails_helper'

RSpec.describe PartyFacade do
  describe "happy path" do
    it "can create an create  " do
      VCR.use_cassette('movie_info') do
        result = PartyFacade.movie_information(550)

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
  end
  describe "sad path" do
    it "can create an create  " do
      VCR.use_cassette('movie_info_sad_path') do
        result = PartyFacade.movie_information(1)

        expect(result.class).to eq(Array)
        expect(result.empty?).to eq(true)
      end
    end
  end
end
