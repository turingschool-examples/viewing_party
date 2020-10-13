require 'rails_helper'

RSpec.describe Movie do
  it "exists" do
    attributes = {title: 'The Godfather',
                  vote_average: '9.3',
                  runtime: 202,
                  genres: ['Crime', 'Drama'],
                  summary: "In the continuing saga of the Corleone crime family, a young Vito Corleone grows up in Sicily and in 1910s New York. In the 1950s, Michael Corleone attempts to expand the family business into Las Vegas, Hollywood and Cuba."}

    movie = Movie.new(attributes)

    expect(movie).to be_a(Movie)
    expect(movie.title).to eq(attributes[:title])
    expect(movie.vote_average).to eq(attributes[:vote_average])
    expect(movie.runtime).to eq(attributes[:runtime])
    expect(movie.genres).to eq(attributes[:genres])
    expect(movie.summary).to eq(attributes[:summary])
  end
end
