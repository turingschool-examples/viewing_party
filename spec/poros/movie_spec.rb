require 'rails_helper'

RSpec.describe Movie do
  it 'can verify that it exists' do
    movie = Movie.new({original_title: 'Fight Club',
                overview: "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy.",
                vote_average: '8.4',
                genres: ["Drama"],
                cast: [{name: "Edward Norton", character: "The Narrator"}, {name: "Brad Pitt", character: "Tyler Durden"}],
                reviews: [{author: "Goddard", review: "Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden."}, {author: "Brett Pascoe", review: "In my top 5 of all time favourite movies. Great story line and a movie you can watch over and over again."}],
                id: '550',
                genres: ['Drama'],
                runtime: '139',
                image_url: 'https://image.tmdb.org/t/p/w500/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg'})

    expect(movie).to be_an_instance_of(Movie)
    expect(movie.title).to eq('Fight Club')
    expect(movie.description).to eq("A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy.")
    expect(movie.rating).to eq('8.4')
    expect(movie.genres).to eq(["Drama"])
    expect(movie.runtime).to eq('139')
    expect(movie.cast).to eq([{name: "Edward Norton", character: "The Narrator"}, {name: "Brad Pitt", character: "Tyler Durden"}])
    expect(movie.reviews).to eq([{author: "Goddard", review: "Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden."}, {author: "Brett Pascoe", review: "In my top 5 of all time favourite movies. Great story line and a movie you can watch over and over again."}])
    expect(movie.id).to eq('550')
    expect(movie.image_url).to eq('https://image.tmdb.org/t/p/w500/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg')
  end
end
