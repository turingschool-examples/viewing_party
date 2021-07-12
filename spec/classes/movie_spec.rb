require 'rails_helper'
require './app/poros/movie'

RSpec.describe Movie do
  describe '#initialize' do
    it 'creates an instance of a movie' do
      movie = Movie.new('tim', 6.5, 213213)

      expect(movie.class).to eq(Movie)
      expect(movie.title).to eq('tim')
      expect(movie.vote).to eq(6.5)
      expect(movie.id).to eq(213213)
    end
  end
end