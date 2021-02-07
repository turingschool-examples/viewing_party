require 'rails_helper'

RSpec.describe Film do
  it 'exists' do
    attrs = {
      id: 1,
      title: 'The Birds',
      vote_average: 8.4,
      runtime: 500,
      genres: [{id: 1, name: 'Horror'}, {id: 2, name: 'Historical'}],
      overview: "Damn these birds are mad!",
      credits:  {cast: [{name: "Turo Pajala", character: "Mary Gifford"}, {name: "Frank Gerry", character: "Bird one"} ]}
    }
    film = Film.new(attrs)

    expect(film.title).to eq('The Birds')
    expect(film.vote_average).to eq(8.4)
    expect(film.id).to eq(1)
    expect(film.runtime).to eq(500)
    expect(film.list_genres).to eq('Horror, Historical')
    expect(film.overview).to eq('Damn these birds are mad!')
    expect(film.credits).to eq({cast: [{name: "Turo Pajala", character: "Mary Gifford"}, {name: "Frank Gerry", character: "Bird one"} ]})
  end

  it "instance methods" do 
    attrs = {
      id: 1,
      title: 'The Birds',
      vote_average: 8.4,
      runtime: 500,
      genres: [{id: 1, name: 'Horror'}, {id: 2, name: 'Historical'}],
      overview: "Damn these birds are mad!",
      credits:  {cast: [{name: "Turo Pajala", character: "Mary Gifford"}, {name: "Frank Gerry", character: "Bird one"} ]}
    }
    film = Film.new(attrs)

    expect(film.cast).to eq([["Turo Pajala", "Mary Gifford"], ["Frank Gerry", "Bird one"]])
  end
end
