require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'class methods' do
    describe '.top_movie_results' do
      it 'returns an array of movie objects' do
        VCR.use_cassette 'imdb_top' do
          actual = MovieFacade.top_movie_results

          expect(actual.class).to eq(Array)
          expect(actual[0].class).to eq(Movie)
          expect(actual[0].title).to eq('Black Widow')
        end
      end
    end
    describe '.top_movie_search_results' do
      it 'returns an array of movie objects' do
        VCR.use_cassette 'imdb_search' do
          actual = MovieFacade.top_movie_search_results('Jack')

          expect(actual.class).to eq(Array)
          expect(actual[0].class).to eq(Movie)
          expect(actual[0].title).to eq('Jack Reacher')
        end
      end
    end
    describe '.movie_data_results' do
      it 'returns a movie_data object' do
        VCR.use_cassette 'imdb_jack_data' do
          actual = MovieFacade.movie_data_results(75780)

          expect(actual.class).to eq(MovieData)
          expect(actual.title).to eq('Jack Reacher')
          expect(actual.runtime).to eq(130)
        end
      end
    end
    describe '.movie_cast_results' do
      it 'returns an array of actor names' do
        VCR.use_cassette 'imdb_jack_cast' do
          actual = MovieFacade.movie_cast_results(75780)

          expect(actual.class).to eq(Array)
          expect(actual.length).to eq(10)
          expect(actual[0].class).to eq(String)
          expect(actual[0]).to eq('Tom Cruise')
        end
      end
    end
    describe '.movie_review_results' do
      it 'returns an array of movie_review object' do
        VCR.use_cassette 'imdb_jack_reviews' do
          actual = MovieFacade.movie_review_results(75780)

          expect(actual.class).to eq(Array)
          expect(actual[0].class).to eq(MovieReview)
          expect(actual[0].name).to eq('Kenneth Axel Carlsson')
          expect(actual[0].review.class).to eq(String)
        end
      end
    end
  end
end