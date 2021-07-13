require 'rails_helper'

RSpec.describe 'MovieFacade' do
  describe 'class methods' do
    describe '::forty_top_rated_movies' do
      it 'returns list of top forty movies' do
        response_body = File.read('spec/fixtures/top_rated.json')
        stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated").
            to_return(status: 200, body: response_body, headers: {})
        movies = MovieFacade.forty_top_rated_movies

        expect(movies).to be_a(Array)
        expect(movies.count).to eq(40)
        expect(movies.first[:title]).to eq("Dilwale Dulhania Le Jayenge")
      end
    end

    describe '::search_movie_title' do
      it 'returns all movies related to query' do
        response_body = File.read('spec/fixtures/top_rated.json')
        stub_request(:get, "https://api.themoviedb.org/3/search/movie?query=Cruella").
            to_return(status: 200, body: response_body, headers: {})
        movies = MovieFacade.search_movie_title("Cruella")

        # require "pry"; binding.pry
        expect(movies).to be_a(Array)
        expect(movies.count).to eq(5)
        expect(movies.first[:title]).to eq("Cruella")
      end
    end

  end


end
