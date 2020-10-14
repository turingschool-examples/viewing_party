require 'rails_helper'

RSpec.describe MovieService do
  it 'fetch movies by search query' do
    search1 = File.read('spec/fixtures/search_movies_1.json')
    search2 = File.read('spec/fixtures/search_movies_2.json')

    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIE_API_KEY']}&include_adult=false&language=en-US&page=1&query=Pirates").to_return(status: 200, body: search1)
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIE_API_KEY']}&include_adult=false&language=en-US&page=2&query=Pirates").to_return(status: 200, body: search2)

    search_results = MovieService.search_movies('Pirates')

    expect(search_results).to be_an(Array)

    next_result = search_results.first

    expect(next_result).to have_key :title
    expect(next_result[:title]).to be_a(String)
    expect(next_result).to have_key :vote_average
    expect(next_result[:vote_average]).to be_a(Float)
    expect(next_result).to have_key :id
    expect(next_result[:id]).to be_a(Integer)
    expect(next_result).to have_key :overview
    expect(next_result[:overview]).to be_an(String)
  end

  it 'fetch list of top rated movies' do
    json1 = File.read('spec/fixtures/top_40_movies_1.json')
    json2 = File.read('spec/fixtures/top_40_movies_2.json')

    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=1").to_return(status: 200, body: json1)
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=2").to_return(status: 200, body: json2)

    search_results = MovieService.get_40_movies(40)

    expect(search_results).to be_an(Array)

    next_result = search_results.first

    expect(next_result).to have_key :title
    expect(next_result[:title]).to be_a(String)
    expect(next_result).to have_key :vote_average
    expect(next_result[:vote_average]).to be_a(Float)
    expect(next_result).to have_key :id
    expect(next_result[:id]).to be_a(Integer)
    expect(next_result).to have_key :overview
    expect(next_result[:overview]).to be_an(String)
  end

  it 'fetch details for specific movie' do
    first_movie = JSON.parse(File.read('spec/fixtures/first_movie_link.json'), symbolize_names: true)
    first_movie_cast = JSON.parse(File.read('spec/fixtures/first_movie_cast.json'), symbolize_names: true)

    first_movie_reviews = JSON.parse(File.read('spec/fixtures/first_movie_reviews.json'), symbolize_names: true)
    json5 = File.read('spec/fixtures/first_movie_reviews.json')
    json1 = File.read('spec/fixtures/top_40_movies_1.json')
    json2 = File.read('spec/fixtures/top_40_movies_2.json')
    json3 = File.read('spec/fixtures/first_movie_link.json')
    json4 = File.read('spec/fixtures/first_movie_cast.json')


    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=1").to_return(status: 200, body: json1)
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=2").to_return(status: 200, body: json2)
    stub_request(:get, "https://api.themoviedb.org/3/movie/#{first_movie[:id]}?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US").to_return(status: 200, body: json3)
    stub_request(:get, "https://api.themoviedb.org/3/movie/#{first_movie[:id]}/credits?api_key=#{ENV['MOVIE_API_KEY']}").to_return(status: 200, body: json4)
    stub_request(:get, "https://api.themoviedb.org/3/movie/#{first_movie[:id]}/reviews?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=1").to_return(status: 200, body: json5)

    search_results = MovieService.get_specific_movie(first_movie[:id])

    expect(search_results).to be_a(Hash)

    expect(search_results).to have_key :title
    expect(search_results[:title]).to be_a(String)
    expect(search_results).to have_key :vote_average
    expect(search_results[:vote_average]).to be_a(Float)
    expect(search_results).to have_key :id
    expect(search_results[:id]).to be_a(Integer)
    expect(search_results).to have_key :overview
    expect(search_results[:overview]).to be_an(String)
  end
end
