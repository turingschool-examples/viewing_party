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
        VCR.use_cassette("tmbd_upcoming_movies") do
          response = @movie.request_api('/movie/upcoming')

          expect(response).to have_key(:results)
          expect(response).to have_key(:page)
          expect(response[:results]).to be_an(Array)
          expect(response[:results].first[:title]).to eq("The Boss Baby: Family Business")
        end
      end
    end
  end
end
