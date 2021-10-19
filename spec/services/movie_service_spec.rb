require 'rails_helper'

describe MoviesService do
  it 'can get all the top 40 movie data' do
    VCR.use_cassette('top_40_call') do
      response = MoviesService.top_40

      expect(response).to be_an Array
    end
  end
end
