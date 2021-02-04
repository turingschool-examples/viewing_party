require 'rails_helper'

RSpec.describe Film do
  it 'exists' do
    attrs = {
      title: 'The Birds',
      vote_average: 8.4
    }

    film = Film.new(attrs)

    expect(film.title).to eq('The Birds')
    expect(film.vote_average).to eq(8.4)
  end
end
