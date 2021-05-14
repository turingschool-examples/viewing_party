require 'rails_helper'

RSpec.describe 'Movie Service' do
  describe '#instance method' do
    describe 'get_movie_data' do
      it 'returns data on forty movies' do
        test = MovieService.new
        results = test.get_popular_movies

        expect(results.count).to eq(40)
      end
      it 'returns data on search results' do
        test = MovieService.new
        results = test.get_search_results("Mortal Kombat")

        expect(results.count).to eq(15)
      end
    end
  end
end
