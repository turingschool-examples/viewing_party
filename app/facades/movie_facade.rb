class MovieFacade
  def self.forty_top_rated_movies
    service = MovieService.new
    movies = service.request_api("/3/movie/top_rated?page=1")[:results] + service.request_api("/3/movie/top_rated?page=2")[:results]
  end

  def self.search_movie_title(title)

    service = MovieService.new
    movies = service.request_api("/3/search/movie?query=#{title}")[:results]
     # + service.request_api("/3/search/movie?query=#{title}?page=2")[:results]
  end

  def self.movie_details_by_id(movie_id)
    service = MovieService.new
    movie_details = service.request_api("/3/movie/#{movie_id}")[:results] + service.    request_api("/3/movie/#{movie_id}/credits")[:results] + service.request_api("/3/movie/#{movie_id}/reviews")[:results]
    @movie = MovieDetails.new(movie_details)
  end

end
