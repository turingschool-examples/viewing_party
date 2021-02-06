require 'rails_helper'

RSpec.describe Film do
  it 'exists' do
    attrs = {
      id: 1,
      title: 'The Birds',
      vote_average: 8.4,
      runtime: 500,
      genres: [{id: 1, name: 'Horror'}, {id: 2, name: 'Historical'}]
    }

    film = Film.new(attrs)

    expect(film.title).to eq('The Birds')
    expect(film.vote_average).to eq(8.4)
    expect(film.id).to eq(1)
    expect(film.runtime).to eq(500)
    expect(film.genres).to eq('Horror, Historical')
  end
end
