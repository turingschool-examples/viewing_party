require 'rails_helper'

describe Movie do
  it 'has attributes' do
    VCR.use_cassette('search') do
      one_search_result = MoviesFacade.search('Holes').first

      expect(one_search_result.title).to eq("Holes")
      expect(one_search_result.id).to eq(8326)
      expect(one_search_result.vote_average).to eq(6.8)
      # expect(one_search_result.genres).to eq(nil)
      # expect(one_search_result.runtime).to eq(nil)
    end
  end
end
