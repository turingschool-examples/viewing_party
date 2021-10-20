require 'rails_helper'

RSpec.describe MovieFacade do
  it '#forty_top_rated_movies' do
    top_forty = MovieFacade.forty_top_rated_movies
    expect(top_forty).to be_an(Array)
    expect(top_forty[0]).to be_a(MovieInfo)
  end

  it '#search_movie_title' do
    search_results = MovieFacade.search_movie_title('baby')
    expect(search_results).to be_an(Array)
    expect(search_results[0]).to be_a(MovieInfo)
  end

  it '#movie_info_by_id' do
    movie = MovieFacade.movie_info_by_id(52)
    expect(movie).to be_a(MovieInfo)
  end

  it '#upcoming' do
    upcoming_movies = MovieFacade.upcoming
    expect(upcoming_movies).to be_an(Array)
    expect(upcoming_movies[0]).to be_a(MovieInfo)
  end

  it '#now_playing' do
    now_playing_movies = MovieFacade.now_playing
    expect(now_playing_movies).to be_an(Array)
    expect(now_playing_movies[0]).to be_a(MovieInfo)
  end

  it '#create_movie_info_array', :vcr do
    service = MovieService.new
    movies = service.request_api('/3/movie/upcoming')[:results]
    movie_info_array = MovieFacade.create_movie_info_array(movies)
    expect(movie_info_array).to be_an(Array)
    expect(movie_info_array[0]).to be_a(MovieInfo)
  end

  # it '#movie_poster' do
  #   movie = MovieFacade.movie_info_by_id(52)
  #   poster_url = MovieFacade.movie_poster(movie.poster)
  #   expect(poster_url).to be_a(String)
  # end
end
