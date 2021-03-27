require 'rails_helper'

RSpec.describe MovieService, type: :model do
  describe 'class methods' do
    it '#movie_service_get', :vcr do
      expect(MovieService.movie_search_get('Jack Reacher', 1)[:results].first[:title]).to eq("Jack Reacher")

      expect(MovieService.movie_search_get('Jack Reacher', 1)[:results].size).to eq(2)
    end

    it '#movie_search_objects', :vcr do
      expect(MovieService.movie_search_objects('Jack Reacher').first.class).to eq(MovieObject)

      expect(MovieService.movie_search_objects('Jack Reacher').first.title).to eq('Jack Reacher')
      expect(MovieService.movie_search_objects('Jack Reacher').last.title).to eq('Jack Reacher: Never Go Back')

      expect(MovieService.movie_search_objects('Jack Reacher').size).to eq(2)
    end

    it '#top_40_get', :vcr do
      expect(MovieService.top_40_get(1)[:results].first[:title]).to eq("Dilwale Dulhania Le Jayenge")
      expect(MovieService.top_40_get(1)[:results].size).to eq(20)
    end

    it '#top_40_objects', :vcr do
      expect(MovieService.top_40_objects.first.class).to eq(MovieObject)

      expect(MovieService.top_40_objects.first.title).to eq("Dilwale Dulhania Le Jayenge")
      expect(MovieService.top_40_objects.last.title).to eq("Maquia: When the Promised Flower Blooms")

      expect(MovieService.top_40_objects.size).to eq(40)
    end

    it '#movie_details_get', :vcr do
      expect(MovieService.movie_details_get(155)[:title]).to eq("The Dark Knight")
      expect(MovieService.movie_details_get(155)[:id]).to eq(155)
    end

    it '#movie_objects', :vcr do
      expect(MovieService.movie_object(155).class).to eq(MovieObject)

      expect(MovieService.movie_object(155).title).to eq("The Dark Knight")
      expect(MovieService.movie_object(155).id).to eq(155)
    end

    it '#movie_cast_get', :vcr do
      expect(MovieService.movie_cast_get(155)[:cast].first[:name]).to eq("Christian Bale")
    end

    it '#reviews_get', :vcr do
      expect(MovieService.reviews_get(155)[:results].first[:author]).to eq("tricksy")
    end
  end
end
