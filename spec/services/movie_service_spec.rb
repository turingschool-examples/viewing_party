require 'rails_helper'

RSpec.describe MovieService do
  it "returns top rated movie data", :vcr do
    search = MovieService.top_rated_movies
    expect(search).to be_an(Array)
    movie_data = search.first

    expect(movie_data).to have_key :title
    expect(movie_data[:title]).to be_a(String)

    expect(movie_data).to have_key :vote_average
    expect(movie_data[:vote_average]).to be_a(Float)
  end

  it "returns searched movie data", :vcr do
    keyword = "Rush"
    search = MovieService.movies_search(keyword)
    movie_data = search.first

    expect(search.length).to eq(40)
    expect(movie_data).to have_key :title
    expect(movie_data[:title]).to be_a(String)

    expect(movie_data).to have_key :vote_average
    expect(movie_data[:vote_average]).to be_a(Float)
  end

  it "returns movie details", :vcr do
    id = 278
    search = MovieService.movie_details(id)

    expect(search).to have_key(:title)
    expect(search[:title]).to be_a(String)
    expect(search).to have_key(:vote_average)
    expect(search[:vote_average]).to be_a(Float)
    expect(search).to have_key(:runtime)
    expect(search[:runtime]).to be_an(Integer)
    expect(search).to have_key(:genres)
    expect(search[:genres]).to be_an(Array)
    expect(search).to have_key(:overview)
    expect(search[:overview]).to be_a(String)
    expect(search).to have_key(:id)
    expect(search[:id]).to be_an(Integer)
  end

  it "returns cast data", :vcr do
    id = 278
    search = MovieService.cast(id)
    cast_member_data = search.first

    expect(search).to be_an(Array)
    expect(cast_member_data).to have_key(:character)
    expect(cast_member_data[:character]).to be_a(String)
    expect(cast_member_data).to have_key(:name)
    expect(cast_member_data[:name]).to be_a(String)
  end

  # it "should have a successful response" do
  #   conn = MovieService.conn
  # end
end
