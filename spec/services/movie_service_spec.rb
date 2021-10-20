require 'rails_helper'

RSpec.describe MovieService do
  before(:each) do
    @movie = MovieService.new
  end

  it 'exists' do
    expect(@movie).to be_a(MovieService)
  end

  describe 'instance methods' do
    describe '#request_api' do
      it 'can connect to tmdb api' do

        response = @movie.request_api('/3/movie/upcoming')
        example = response[:results].first
        expect(response).to have_key(:results)
        expect(response).to have_key(:page)
        expect(response[:results]).to be_an(Array)

        expect(example).to have_key(:title)
        expect(example[:title]).to be_a(String)

        expect(example).to have_key(:vote_average)

        expect(example).to have_key(:genre_ids)
        expect(example[:genre_ids]).to be_an(Array)
        expect(example[:genre_ids][0]).to be_an(Integer)

        expect(example).to have_key(:overview)
        expect(example[:overview]).to be_a(String)

        expect(example).to have_key(:id)
        expect(example[:id]).to be_an(Integer)
      end
    end
  end
end
