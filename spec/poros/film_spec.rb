require 'rails_helper'

RSpec.describe Film do
  describe 'happy path' do
    it 'should build a Film PORO based on input' do
      data = ''
      page = 1

      VCR.use_cassette('top_movie_data') do
        data = MovieService.top_films(page)
      end

      film = Film.new(data[:results][0])
      expect(film).to be_a(Film)
      expect(film.title).to be_a(String)
      expect(film.id).to be_a(Integer)
      expect(film.vote_average).to be_a(Float)
    end
  end
end
