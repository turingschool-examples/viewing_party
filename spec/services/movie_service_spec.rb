require 'rails_helper'

RSpec.describe MovieService do 
  before(:each) do
    @m = MovieService.new
  end

  it 'exists' do
    expect(@m).to be_a(MovieService)
  end

  describe 'instance methods' do 
    describe '#request_api' do 
     it 'can connect to tmdb api' do
        VCR.use_cassette("tmbd_upcoming_movies") do
          response = @m.request_api('3/movie/upcoming')

          expect(response).to have_key(:results)
          expect(response).to have_key(:page)
          expect(response[:results]).to be_an(Array)
          expect(response[:results].first[:title]).to eq("Luca")
        end
      end
    end

    describe '#top_rated' do 
      it 'can return list of top rated movies' do
        VCR.use_cassette("tmdb_top_rated_movies") do
          response = @m.top_rated

          expect(response).to have_key(:results)
          expect(response).to have_key(:page)
          expect(response[:results]).to be_an(Array)
          expect(response[:results].first[:title]).to eq("Dilwale Dulhania Le Jayenge")
        end
      end
    end

    describe '#find_by_title' do
      it 'can find movie by its title' do
        VCR.use_cassette("tmdb_find_by_title") do
          response = @m.find_by_title("Cruella")

          expect(response).to have_key(:results)
          expect(response).to have_key(:page)
          expect(response[:results]).to be_an(Array)
          expect(response[:total_results]).to eq(5)
          expect(response[:results].first[:title]).to eq("Cruella")
          expect(response[:results].last[:title]).to eq("Cruella De Vil: Drawn to Be Bad")
        end
      end
    end

    describe '#find_by_id' do
      it 'can find movie by movie id' do
        VCR.use_cassette("tmdb_find_movie_by_movie_id") do
          response = @m.find_by_id(337404)

          expect(response[:title]).to eq("Cruella")
          expect(response[:revenue]).to eq(204278984)
          expect(response[:runtime]).to eq(134)
        end
      end
    end

    describe '#find_cast' do
      it 'can find cast by movie id' do
        VCR.use_cassette("tmdb_find_cast_by_movie_id") do 
          response = @m.find_cast(337404)

          expect(response).to have_key(:cast)
          expect(response[:cast].first[:name]).to eq("Emma Stone")
          expect(response[:cast].last[:name]).to eq("John Wolfe")
          expect(response[:cast].length).to eq(30)
        end
      end
    end

    describe '#find_reviews' do
       it 'can find reviews by movie id' do
        VCR.use_cassette("tmdb_find_reviews") do 
          response = @m.find_reviews(337404)

          expect(response).to have_key(:results)
          expect(response[:results].first[:author]).to eq("msbreviews")
          expect(response[:results].first[:author_details][:username]).to eq("msbreviews")
          expect(response[:results].length).to eq(3)
        end
      end
    end
  end
end
