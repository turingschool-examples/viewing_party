require 'rails_helper'

RSpec.describe MovieProcessing do
  describe "instance variables" do
    it "exists" do
      movie_processing = MovieProcessing.new

      expect(movie_processing).to be_instance_of(MovieProcessing)
    end

    describe "#top_rated_movies" do
      it "returns 40 results" do
        VCR.use_cassette('top_40_movies') do
          movie_processing = MovieProcessing.new

          expect(movie_processing.top_rated_movies.count).to eq(40)
        end
      end

      it "returns only the title, vote average, and poster path for each movie" do
        VCR.use_cassette('top_40_movies') do
          movie_processing = MovieProcessing.new

          expect(movie_processing.top_rated_movies.first[1].keys).to eq([:title, :vote_average, :poster_path])
        end
      end

      it "returnes an error if the request is not completed" do
        movie_processing = MovieProcessing.new
        api_key = ENV['movie_api_key']
        stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{api_key}&language=en-US&page=1").
          to_return(status: 404, body: "", headers: {})

        expect(movie_processing.top_rated_movies).to eq({error: true})
      end
    end

    describe "#search" do
      it "returns the first 40 results that match the keywords provided" do
        VCR.use_cassette('search_for_movies') do
          movie_processing = MovieProcessing.new

          expect(movie_processing.search("the").count).to eq(40)
          # expect(movie_processing.search("the").first[1].keys).to eq([:title, :vote_average, :poster_path])
        end
      end

      it "returns all of the results that match the keywords provided if less then 40" do
        VCR.use_cassette('search_for_movies_short') do
          movie_processing = MovieProcessing.new

          expect(movie_processing.search("finding nemo").count).to eq(3)
        end
      end

      it "returns only the title, vote average, and poster path for each movie" do
        VCR.use_cassette('search_for_movies_1') do
          movie_processing = MovieProcessing.new

          expect(movie_processing.search("the").first[1].keys).to eq([:title, :vote_average, :poster_path])
        end
      end

      it "returnes an error if the request is not completed" do
        movie_processing = MovieProcessing.new
        api_key = ENV['movie_api_key']
        stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{api_key}&language=en-US&page=1").
          with(
            headers: {
           'Accept'=>'*/*',
           'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
           'User-Agent'=>'Faraday v1.3.0'
            }).
          to_return(status: 404, body: "", headers: {})

        expect(movie_processing.top_rated_movies).to eq({error: true})
      end
    end

    describe "#movie_info" do
      it "returns the nessisary movie info" do

      end
    end
  end
end
