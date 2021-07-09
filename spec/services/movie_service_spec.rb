require 'rails_helper'

RSpec.describe MovieService do 
  before(:each) do
    @m = MovieService.new
  end

  it 'exists' do
    expect(@m).to be_a(MovieService)
  end

  describe 'instance methods' do 
    describe '#top_rated' do 
     it 'can connect to tmdb api' do
        response = @m.request_api('3/movie/upcoming')
        
        expect(response).to have_key(:results)
        expect(response).to have_key(:page)
        expect(response[:results]).to be_an(Array)
        expect(response[:results].first[:title]).to eq("Luca")
      end
    end

    describe '#top_rated' do 
      it 'can return list of top rated movies' do
        response = @m.top_rated
        # json_response = File.open('./fixtures/')
        # stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated").
        # to_return(status: 200, body: json_response)

        expect(response).to have_key(:results)
        expect(response).to have_key(:page)
        expect(response[:results]).to be_an(Array)
        expect(response[:results].first[:title]).to eq("Dilwale Dulhania Le Jayenge")
      end
    end

    describe '#find_by_title' do
      it 'can find movie by its title' do
        response = @m.find_by_title("Cruella")
        # json_response = File.open('./fixtures/')
        # stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated").
        # to_return(status: 200, body: json_response)

        expect(response).to have_key(:results)
        expect(response).to have_key(:page)
        expect(response[:results]).to be_an(Array)
        expect(response[:total_results]).to eq(5)
        expect(response[:results].first[:title]).to eq("Cruella")
        expect(response[:results].last[:title]).to eq("Cruella De Vil: Drawn to Be Bad")
      end
    end

    describe '#find_by_id' do
      it 'can find movie by movie id' do
        response = @m.find_by_id(337404)

        expect(response[:title]).to eq("Cruella")
        expect(response[:revenue]).to eq(204278984)
        expect(response[:runtime]).to eq(134)
      end
    end
  end
end
