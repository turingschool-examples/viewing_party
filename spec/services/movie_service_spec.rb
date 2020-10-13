require 'rails_helper'

RSpec.describe MovieService do
  it 'fetches movie index data' do
  end

  it 'fetches movie details data' do
    VCR.use_cassette('movie_details') do
      @movie_details = MovieService.get_details(500)
      expect(@movie_details).to be_a(Hash)
      expect(@movie_details[:title]).to eq('Reservoir Dogs')
      expect(@movie_details[:id]).to eq(500)
      expect(@movie_details[:vote_average]).to eq(8.2)
      expect(@movie_details[:runtime]).to eq(99)
      expect(@movie_details[:overview]).to be_a(String)
      expect(@movie_details[:genres]).to be_a(Array)
    end
  end
end