require 'rails_helper'
require './app/assets/classes/movie'
RSpec.describe Movie do
  describe '#initialize' do
    it 'creates an instance of a movie' do
      movie = Movie.new('tim', 6.5)

      expect(movie.class).to eq(Movie)
      expect(movie.title).to eq('tim')
      expect(movie.vote).to eq(6.5)
    end
  end
end