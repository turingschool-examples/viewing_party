class MovieFacade
  def self.forty_top_rated_movies
    service = MovieService.new
    page1 = '/3/movie/top_rated?page=1'
    page2 = '/3/movie/top_rated?page=2'
    movies_json = service.request_api(page1)[:results] + service.request_api(page2)[:results]
    create_movie_info_array(movies_json)
  end

  def self.search_movie_title(title)
    service = MovieService.new
    search_results_json = service.request_api("/3/search/movie?query=#{title}")[:results]
    create_movie_info_array(search_results_json)
  end

  def self.movie_info_by_id(movie_id)
    service = MovieService.new
    movie = service.request_api("/3/movie/#{movie_id}")
    cast = service.request_api("/3/movie/#{movie_id}/credits")
    reviews = service.request_api("/3/movie/#{movie_id}/reviews")

    MovieInfo.new(movie, cast, reviews)
  end

  def self.upcoming
    service = MovieService.new
    upcoming_movies = service.request_api('/3/movie/upcoming')[:results]
    create_movie_info_array(upcoming_movies)
  end

  def self.now_playing
    service = MovieService.new
    now_playing_movies = service.request_api('/3/movie/now_playing')[:results]
    create_movie_info_array(now_playing_movies)
  end

  def self.create_movie_info_array(json_results)
    json_results.map do |movie_info|
      MovieInfo.new(movie_info)
    end
  end

  # def self.movie_poster(movie_poster)
  #   service = MovieService.new
  #   image = service.image_request_api("/t/p/w300#{movie_poster}")
  #   image.env.url.to_s
  # end
end
