require 'rails_helper'

RSpec.describe 'Movie Service' do
  describe '#instance method' do
    describe 'get_movie_data' do
      it 'returns data on forty movies', :vcr do
        results = MovieService.fetch_popular_movies
        expect(results.count).to eq(40)
      end

      it 'returns data on search results', :vcr do
        results = MovieService.get_search_results('Mortal Kombat')

        expect(results.count).to eq(15)
      end

      it 'returns data on a specific movie', :vcr do
        results = MovieService.get_movie_details('460465')

        expect(results[:title]).to eq('Mortal Kombat')
        expect(results[:vote_average]).to eq(7.6)
        expect(results[:runtime]).to eq(110)
        expect(results[:genres][0][:name]).to eq('Action')
        expect(results[:overview].split(' ').first).to eq('Washed-up')
      end

      it 'returns cast info for a specific movie', :vcr do
        results = MovieService.get_movie_cast_details('460465')

        expect(results[0][:name]).to eq('Lewis Tan')
        expect(results[0][:character]).to eq('Cole Young')
        expect(results[1][:name]).to eq('Jessica McNamee')
        expect(results[1][:character]).to eq('Sonya Blade')
      end

      it 'returns each reviewer author and info', :vcr do
        results = MovieService.get_movie_review_details('460465')

        expect(results[0][:author_details][:username]).to eq('TheDarkKnight31')
        expect(results[0][:author_details][:rating]).to eq(10.0)
        expect(results[2][:author_details][:username]).to eq('msbreviews')
        expect(results[2][:author_details][:rating]).to eq(6.0)
      end

      it 'returns name of each buy (seller)', :vcr do
        results = MovieService.get_buy_providers('1891')

        expect(results[0][:provider_name]).to eq('Apple iTunes')
        expect(results[3][:provider_name]).to eq('Google Play Movies')
      end

      it 'returns name of each renter', :vcr do
        results = MovieService.get_rent_providers('1891')

        expect(results[0][:provider_name]).to eq('Apple iTunes')
        expect(results[4][:provider_name]).to eq('YouTube')
      end

      it 'returns name of each streamer', :vcr do
        results = MovieService.get_streaming_providers('1891')

        expect(results[0][:provider_name]).to eq('DIRECTV')
        expect(results[1][:provider_name]).to eq('Disney Plus')
      end
      it 'returns similar movies', :vcr do
        results = MovieService.get_similar_movies('460465')

        expect(results.count).to eq(5)
      end
    end
  end
end
