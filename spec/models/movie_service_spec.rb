require 'rails_helper'

describe User, type: :model do
  describe 'class methods' do
    it 'can can search movies'do
      expect(MovieService.search_movies("jack reacher").size).to eq(2)
    end
    it 'can make searched movies search movies'do
      expect(MovieService.make_searched_movies("jack reacher").first.class).to eq(Film)
      expect(MovieService.make_searched_movies("jack reacher").size).to eq(2)
    end
  end
end
