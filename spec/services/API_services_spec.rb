require 'rails_helper'

describe APIServices do
  describe "#get_search_movie" do
    it 'can search movie' do
      search_movie = "Shawshank"
      # response_body = File.open("#{Rails.root}/spec/fixtures/shawshank_search.json")
      response_body = File.read('spec/fixtures/shawshank_search.json')
      # make_request(:get, "3/search/movie?api-key=#{ENV['MOVIES_DB_API_KEY']}&query=shawshank&page=1", response_body)
      stub_request(:get, "https://api.themoviedb.org/3/search/movie?api-key&query=shawshank").
         with(
           headers: {

          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.5.0'
           }).
         to_return(status: 200, body: "", headers: {})

      response_1 = APIServices.get_search_movie(search_movie)

      expect(response_1).to be_a(Array)
    end
  end
end
