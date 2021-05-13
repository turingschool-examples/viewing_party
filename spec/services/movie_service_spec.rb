require 'rails_helper'

RSpec.describe 'Movie Service' do
  describe '#instance method' do
    describe "get_movie_data" do
      it 'returns data on forty movies' do
        test = MovieService.new 
        results = test.get_movie_data
      
        expect(results.count).to eq(40)
      end 
    end
  end
end 