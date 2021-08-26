require 'rails_helper'

RSpec.describe MovieService do
  before :each do
    @service = MovieService.new
  end

  describe 'instance methods' do
    it 'can create 40 popular movies' do
      expect(@service.top_movies.count).to eq(40)
    end

    describe '#get_movie' do
      it 'can return information for a single movie' do
        # json_response = File.read('spec/fixtures/movie.json')
        #
        # stub_request(:get, "https://api.themoviedb.org/3/movie/550?api_key=#{ENV['movie_key']}").
        # to_return(status: 200, body: json_response)

        # expect(page.status_code).to eq(200)
        expect(@service.get_movie('550')).to have_key(:original_title)
        expect(@service.get_movie('550')).to have_key(:vote_average)
        expect(@service.get_movie('550')).to have_key(:runtime)
      end
    end

    describe '#get_popular_movies' do
      it 'returns a list of popular movies' do
        # json_response = File.read('spec/fixtures/popular_movies1.json')
        #
        # stub_request(:get, "https://api.themoviedb.org/3/movie/popular?api_key=#{ENV['movie_key']}&page=1").
        # to_return(status: 200, body: json_response)

        # expect(page.status_code).to eq(200)
        expect(@service.get_popular_movies('1').size).to eq(20)
        expect(@service.get_popular_movies('1').class).to eq(Array)

        # json_response = File.read('spec/fixtures/popular_movies2.json')
        #
        # stub_request(:get, "https://api.themoviedb.org/3/movie/popular?api_key=#{ENV['movie_key']}&page=2").
        # to_return(status: 200, body: json_response)

        # expect(page.status_code).to eq(200)
        expect(@service.get_popular_movies('2').size).to eq(20)
        expect(@service.get_popular_movies('2').class).to eq(Array)
      end
    end

    describe '#movie_search' do
      it 'can search for a list of movies' do
        # json_response = File.read('spec/fixtures/search_movie.json')
        #
        # stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movie_key']}&query=fight+club&include_adult=false").
        # to_return(status: 200, body: json_response)

        # expect(page.status_code).to eq(200)
        expect(@service.movie_search('fight club').class).to eq(Array)
        expect(@service.movie_search('fight club')[0].class).to eq(Hash)
        expect(@service.movie_search('fight club').size).to eq(20)
      end
    end

    describe '#get_reviews' do
      it 'can search for a list of movies' do
        json_response = File.read('spec/fixtures/movie_reviews.json')

        stub_request(:get, "https://api.themoviedb.org/3/movie/550/reviews?api_key=#{ENV['movie_key']}").
        to_return(status: 200, body: json_response)

        # expect(page.status_code).to eq(200)
        expect(@service.get_review('550').class).to eq(Array)
        expect(@service.get_review('550')[0].class).to eq(Hash)
        expect(@service.get_review('550')[0]).to have_key(:author)
        expect(@service.get_review('550')[0]).to have_key(:content)
        expect(@service.get_review('550').size).to eq(7)
      end
    end

    describe '#get_cast' do
      it 'can search for a list of movies' do
        # json_response = File.read('spec/fixtures/movie_cast.json')
        #
        # stub_request(:get, "https://api.themoviedb.org/3/movie/550/credits?api_key=#{ENV['movie_key']}").
        # to_return(status: 200, body: json_response)

        # expect(page.status_code).to eq(200)
        expect(@service.get_cast('550').class).to eq(Array)
        expect(@service.get_cast('550')[0].class).to eq(Hash)
        expect(@service.get_cast('550')[0]).to have_key(:name)
        expect(@service.get_cast('550')[0]).to have_key(:character)
        expect(@service.get_cast('550').size).to eq(10)
      end
    end
  end
end
