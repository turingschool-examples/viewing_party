require 'rails_helper'

RSpec.describe Film do
  describe "happy path" do
    it 'tests the structure of our api data for top rated movies' do
      data = ''
      page = 1

      VCR.use_cassette('top_movie_data') do
        data = MovieService.top_films(page)
      end

      expect(data).to be_a(Hash)
      expect(data).to have_key(:results)
      expect(data[:results][0]).to be_a(Hash)
      expect(data[:results].length).to eq(20)
      expect(data[:results][0][:title]).to be_a(String)
      expect(data[:results][0][:popularity]).to be_a(Float)
      expect(data[:results][0][:id]).to be_a(Integer)
    end

    it 'tests the structure of our api data for searched movies' do
      data = ''
      page = 1

      VCR.use_cassette('searched_movie_data') do
        data = MovieService.top_films(page)
      end

      expect(data).to be_a(Hash)
      expect(data).to have_key(:results)
      expect(data[:results][0]).to be_a(Hash)
      expect(data[:results].length).to eq(20)
      expect(data[:results][0][:title]).to be_a(String)
      expect(data[:results][0][:popularity]).to be_a(Float)
      expect(data[:results][0][:id]).to be_a(Integer)
    end

    it "returns the top rated movies" do
      data = ''
      page = 1

      VCR.use_cassette('top_movie_data') do
        data = MovieService.top_films(page)
      end

      expect(data[:results].length).to eq(20)
      expect(data[:results][0]).to have_key(:title)
      expect(data[:results][0]).to have_key(:id)
      expect(data[:results][0]).to have_key(:popularity)
    end

    it "returns movies related to searched for keyword" do
      data = ''
      page = 1
      keyword = 'fire'

      VCR.use_cassette('searched_movie_data') do
        data = MovieService.film_finder(page, keyword)
      end

      expect(data[:results].length).to be <= 20
      expect(data[:results][0]).to have_key(:title)
      expect(data[:results][0]).to have_key(:id)
      expect(data[:results][0]).to have_key(:popularity)
    end
  end
end
