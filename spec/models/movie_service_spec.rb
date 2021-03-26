require 'rails_helper'

RSpec.describe MovieService, type: :model do
  describe 'class methods' do
    it '#movie_search_get' do
      expect(MovieService.movie_search_get('Jack Reacher', 1).class).to eq(Hash)
    end

    it '#movie_search_objects' do
      jack_reacher = MovieService.movie_search_objects('Jack Reacher')
      expect(jack_reacher.class).to eq(Array)
      expect(jack_reacher.first.class).to eq(MovieObject)
      expect(jack_reacher.size).to eq(2)
    end

    it '#top_40_get' do
      expect(MovieService.top_40_get(1).class).to eq(Hash)
    end

    it '#top_40_objects' do
      top_40 = MovieService.top_40_objects
      expect(top_40.first.class).to eq(MovieObject)
      expect(top_40.size).to eq(40)
    end

    it '#movie_details_get' do
      expect(MovieService.movie_details_get(100).class).to eq(Hash)
    end

    it '#movie_objects' do
      expect(MovieService.movie_object(100).class).to eq(MovieObject)
    end

    it '#movie_cast_get' do
      expect(MovieService.movie_cast_get(100).class).to eq(Hash)
    end

    it '#movie_reviews_get' do
      expect(MovieService.reviews_get(100).class).to eq(Hash)
    end
  end
end
