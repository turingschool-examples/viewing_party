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
     it 'can connect to tmdb api', :vcr do
        VCR.use_cassette('tmbd_upcoming_movies') do
          response = @movie.request_api('/3/movie/upcoming')

          expect(response).to have_key(:results)
          expect(response).to have_key(:page)
          expect(response[:results]).to be_an(Array)
          expect(response[:results].first[:title]).to eq('Venom: Let There Be Carnage')
        end
      end
    end
  end
end
