require "rails_helper"

describe Film do
  it "exists" do
    attributes = {
              id: 1,
		          title: "Boys in the band",
		          vote_average: 7,
		          runtime: 126,
		          popularity: 7,
		          genres: "Theatre/Drama",
		          overview: "Orginally staged and turned into theatrical movie!",
		          poster: "poster of cool movie",
		          cast: "John, Jacob, Jessica, Geri",
		          reviews: "Fanstastic rendition!"

    }
    film = Film.new(attributes) 

    expect(film).to be_an_instance_of(Film)
  end

  it "has attributes" do
    attributes = {
              id: 1,
		          title: "Boys in the Band",
		          vote_average: 7,
		          runtime: 126,
		          popularity: 7,
		          genres: "Theatre/Drama",
		          overview: "Orginally staged and turned into theatrical movie!",
		          poster_path: "poster of cool movie"
		         
    }
    cast = "John, Jacob, Jessica, Geri"
    reviews = "Fanstastic rendition!"
    film = Film.new(attributes, cast, reviews) 

    expect(film.id).to eq(1)
    expect(film.title).to eq("Boys in the band")
    expect(film.vote_average).to eq(7)
    expect(film.runtime).to eq(126)
    expect(film.popularity).to eq(7)
    expect(film.genres).to eq("Theatre/Drama")
    expect(film.overview).to eq("Orginally staged and turned into theatrical movie!")
    expect(film.poster).to eq("poster of cool movie")
    expect(film.cast).to eq( "John, Jacob, Jessica, Geri")
    expect(film.reviews).to eq("Fanstastic rendition!")
  end

  it 'can render an image from poster_path' do
    attributes = {
              id: 1,
		          title: "Boys in the Band",
		          vote_average: 7,
		          runtime: 126,
		          popularity: 7,
		          genres: "Theatre/Drama",
		          overview: "Orginally staged and turned into theatrical movie!",
		          poster_path: "poster123"
		         
    }
    cast = "John, Jacob, Jessica, Geri"
    reviews = "Fanstastic rendition!"

    film = Film.new(attributes, cast, reviews) 

    expect(film.render_image).to eq("https://image.tmdb.org/t/p/w500poster123")
  end
end