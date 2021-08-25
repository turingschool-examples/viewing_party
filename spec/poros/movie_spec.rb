require 'rails_helper'

RSpec.describe Movie do
  before :each do
    
  end

  it 'can verify that it exists' do
    movie = Movie.new({ 
                        original_title: 'fight club',
                        overview: 'the bee knees',
                        vote_average: '7.9',
                        genres: ['action', 'drama', 'suspense'],
                        runtime: '139'
                      })
    expect(movie).to be_an_instance_of(Movie)
    expect(movie.title).to eq('fight club')
    expect(movie.description).to eq('the bee knees')
    expect(movie.rating).to eq('7.9')
    expect(movie.genres).to eq(['action', 'drama', 'suspense'])
    expect(movie.runtime).to eq('139')

  end
end

