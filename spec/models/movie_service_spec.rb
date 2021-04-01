require 'rails_helper'

describe User, type: :model do
  describe 'class methods' do
    it 'can can search movies' do
      VCR.use_cassette('search_for_jack_reacher') do
        expect(MovieService.search_movies("jack reacher")[:results].size).to eq(2)
      end
    end
    it 'can make searched movies search movies' do
<<<<<<< HEAD
      VCR.use_cassette('search_for_jack_reacher_1') do 
=======
      VCR.use_cassette('make_search_for_jack_reacher') do
>>>>>>> main
        expect(MovieService.make_searched_movies("jack reacher").first.class).to eq(Film)
        expect(MovieService.make_searched_movies("jack reacher").size).to eq(2)
      end
    end
  end
end
