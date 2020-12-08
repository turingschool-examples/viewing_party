require 'rails_helper'

describe 'Film Poro' do
  before(:each) do
    @raw_data = File.read('./spec/fixtures/film_data_request/film_data_request.txt')
    @film_data = JSON.parse(@raw_data, symbolize_names: true)
    @film = Film.new(@film_data)
  end
  it 'has attributes' do

    expect(@film.api_movie_id).to eq(@film_data[:id])
    expect(@film.title).to eq(@film_data[:title])
    expect(@film.rating).to eq(@film_data[:vote_average])
    expect(@film.runtime_min).to eq(@film_data[:runtime])
    expect(@film.overview).to eq(@film_data[:overview])
    expect(@film.genres).to eq('Drama, Action, Crime, Thriller')
  end

  describe 'it has method to return altered data' do
    it 'can convert time' do
      expect(@film.runtime_display).to eq('2 hrs 32 min')
    end

    it 'can pull cast data and create new Actors' do
      actors = @film.cast
      expect(actors.count).to eq(134)
      expect(actors.first.class).to eq(Actor)
    end

    it 'can pull review data and create new Reviews' do
      reviews = @film.reviews
      expect(reviews.count).to eq(5)
      expect(reviews.first.class).to eq(Review)
    end

    it 'will return empty array if data does not exist' do
      @film_data[:credits] = nil
      @film_data[:reviews] = nil
      film = Film.new(@film_data)
      expect(film.cast).to eq([])
      expect(film.reviews).to eq([])
    end
  end
end
