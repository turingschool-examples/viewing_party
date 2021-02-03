require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    attrs = {
      title: 'The Birds',
      vote_average: 8.4
    }

    movie = Movie.new(attrs)

    expect(movie.title).to eq('The Birds')
    expect(movie.vote_average).to eq(8.4)
  end
end
