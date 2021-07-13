require 'rails_helper'

describe APIServices do
  describe "class methods" do
    describe "#get_search_movie" do
      it 'returns primary information about a movie' do
        response_body = File.read('spec/fixtures/shawshank_search.json')

        stub_request(:get, "https://api.themoviedb.org/3/movie/278?api_key=0ac03930ac7ad73e4782acd4540af5a7&language=en-US")
        # to_return(status:200, body: response_body, headeres: {})

        response = APIServices.get_search_movie

        expect(response).to be_a Hash
      end
    end
  end
end
