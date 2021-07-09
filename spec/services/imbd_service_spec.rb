require 'rails_helper'

RSpec.describe ImdbService do
  describe 'class methods' do
    describe '.top_movies_search' do
      it 'returns an array based on search' do
        VCR.use_cassette 'imdb_search' do
          actual = ImdbService.top_movies_search('Jack')

          expect(actual.class).to eq(Array)
          expect(actual[0][:title].include?('Jack')).to eq(true)
          expect(actual[0][:title].nil?).to eq(false)
          expect(actual[0].class).to eq(Hash)
          expect(actual.count).to eq(40)
        end
      end
      it 'returns No Movies Found if not title matches' do
        VCR.use_cassette 'imdb_nil' do
          actual = ImdbService.top_movies_search('klsdjfl')

          expect(actual).to eq('No Movies Found')
        end
      end
    end
    describe '.top_movies' do
      it 'returns an array containing the top movies titles and vote average' do
        VCR.use_cassette 'imdb_top' do
          actual = ImdbService.top_movies

          expect(actual.class).to eq(Array)
          expect(actual[0][:title].include?('Luca')).to eq(true)
          expect(actual[0][:title].nil?).to eq(false)
          expect(actual[0].class).to eq(Hash)
          expect(actual.count).to eq(40)
        end
      end
    end
  end
end