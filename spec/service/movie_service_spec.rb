require 'rails_helper'

RSpec.describe Film do
  describe "happy path" do
    it 'returns the top rated movies based on user rating based on page number' do
      data = ''
      page = 1

      VCR.use_cassette('top_movie_data') do
        data = MovieService.top_films(page)
      end

      expect(data).to have_key(:results)
      expect(data).to be_a(Hash)
      expect(data[:results][0]).to be_a(Hash)
      expect(data[:results][0][:title]).to be_a(String)
      expect(data[:results][0][:popularity]).to be_a(Float)
      expect(data[:results][0][:id]).to be_a(Integer)
    end
  end
end
