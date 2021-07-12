require 'rails_helper'

RSpec.describe MovieData do
  describe '#initialize' do
    it 'creates a MovieData object' do
      actual = MovieData.new({
        title: 'Bills Big Day', 
        vote_average: 5, 
        runtime: 120, 
        genres: {id: 80, name: "Crime"}, 
        overview: 'Bill has a very bad day.', 
        vote_count: 236 
      })

      expect(actual.title).to eq('Bills Big Day')
      expect(actual.vote_average).to eq(5)
      expect(actual.runtime).to eq(120)
      expect(actual.genres[:name]).to eq('Crime')
      expect(actual.overview).to eq('Bill has a very bad day.')
      expect(actual.vote_count).to eq(236)
      expect(actual.class).to eq(MovieData)
    end
  end
end