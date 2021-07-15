require 'rails_helper'

describe APIServices do
  describe "#get_search_movie" do
    it 'displays data for top 40 rated movies' do
      response_body_1 = File.read('spec/fixtures/top_rated_pg1.json')
      response_body_2 = File.read('spec/fixtures/top_rated_pg2.json')

      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['api_key']}&language=en-US&page=1").
      to_return(status: 200, body: response_body_1, headers: {})

      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['api_key']}&language=en-US&page=2").
      to_return(status: 200, body: response_body_2, headers: {})
      # top_rated_stub

      response = APIServices.top_rated_query

      expect(response_1).to be_an(Array)
      expect(response_1).to be_a(Hash)
    end

    # it 'can search movie' do
    #   movie_title = "Shawshank"
    #   response_body = File.read('spec/fixtures/shawshank_search.json')
    #   stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['api_key']}&language=en-US&page=1&query=Shawshank").
    #   to_return(status: 200, body: response_body_1, headers: {})
    #
    #   response_1 = APIServices.movie_title_query(movie_title)
    #
    #   expect(response_1).to be_a(Array)
    # end
  end
end
