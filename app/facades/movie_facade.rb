class MovieFacade
  def self.forty_top_rated_movies
    service = MovieInfo.new
    movies = service.request_api('/3/movie/top_rated?page=1')[:results] + service.request_api('/3/movie/top_rated?page=2')[:results]
  end

  def self.search_movie_title(title)
    service = MovieInfo.new
    movies = service.request_api("/3/search/movie?query=#{title}")[:results]
  end
end
