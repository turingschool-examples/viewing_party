require 'rails_helper'

describe Movie do
  it 'has attributes' do
    VCR.use_cassette('details_godfather') do
      @movie = MoviesFacade.details(238)

      expect(@movie.title).to eq("Holes")
      expect(@movie.id).to eq(8326)
      expect(@movie.vote_average).to eq(6.8)
      expect(@movie.genres).to eq(nil)
      expect(@movie.runtime).to eq(nil)
      expect(@movie.overview).to eq(nil)
      expect(@movie.total_results).to eq(nil)
      expect(@movie.cast).to eq(nil)
      expect(@movie.reviews).to eq(nil)
    end
  end

  it '#first_10_cast_members' do

  end

  it '#genres_translated' do

  end
end
