class MovieFacade
  def self.forty_top_rated_movies
    service = MovieService.new
    service.request_api('/movie/top_rated?page=1')[:results] + service.request_api('/movie/top_rated?page=2')[:results]
  end

  def self.search_movie_title(title)
    service = MovieService.new
    service.request_api("/search/movie?query=#{title}")[:results]
  end
end
