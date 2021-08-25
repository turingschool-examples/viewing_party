require 'rails_helper'

RSpec.describe MovieService do
  before :each do
    @service = MovieService.new
  end

  describe 'instance methods' do
    describe '#get_movie' do
      it 'can return information for a single movie' do
        expect(@service.get_movie('550')).to have_key(:original_title)
        expect(@service.get_movie('550')).to have_key(:vote_average)
        expect(@service.get_movie('550')).to have_key(:runtime)
      end
    end

    describe '#get_popular_movies' do
      it 'returns a list of popular movies' do
        expect(@service.get_popular_movies('1').size).to eq(20)
        expect(@service.get_popular_movies('1').class).to eq(Array)

        expect(@service.get_popular_movies('2').size).to eq(20)
        expect(@service.get_popular_movies('2').class).to eq(Array)
      end
    end

    describe '#movie_search' do
      it 'can search for a list of movies' do
        expect(@service.movie_search('fight club').class).to eq(Array)
        expect(@service.movie_search('fight club')[0].class).to eq(Hash)
        expect(@service.movie_search('fight club').size).to eq(20)
      end
    end
  end
end