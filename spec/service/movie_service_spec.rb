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

    it "returns individual movie data specified by keyword" do
      data = ''
      id = 238

      VCR.use_cassette('specific_searched_movie_data') do
        data = MovieService.movie_data(id)
      end

      expect(data).to have_key(:title)
      expect(data).to have_key(:revenue)
      expect(data).to have_key(:overview)
      expect(data).to have_key(:genres)
      expect(data).to have_key(:runtime)
      expect(data[:genres]).to be_an(Array)
    end

    it "returns cast data for a specific movie" do
      data = ''
      id = 238

      VCR.use_cassette('specific_cast_movie_data') do
        data = MovieService.cast_data(id)
      end

      expect(data[0]).to have_key(:name)
      expect(data[0]).to have_key(:character)
      expect(data[0]).to have_key(:popularity)
      expect(data).to be_an(Array)
    end

    it "returns review data for a specific movie" do
      data = ''
      id = 238

      VCR.use_cassette('specific_review_movie_data') do
        data = MovieService.review_data(id)
      end

      expect(data[0]).to have_key(:author)
      expect(data[0]).to have_key(:author_details)
      expect(data[0]).to have_key(:content)
      expect(data).to be_an(Array)
      expect(data[0]).to be_an(Hash)
      expect(data[0][:author_details]).to be_an(Hash)
    end
  end
end
