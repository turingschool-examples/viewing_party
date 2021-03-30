require 'ostruct'

class MovieFacade

  def self.top_rated(limit)
    MovieService.top_rated(limit)
  end

  def self.search(keywords, limit)
    MovieService.search(keywords, limit)
  end

  def self.movie_info(api_movie_id)
    MovieService.movie_info(api_movie_id)
  end
end
