require 'ostruct'

class MovieFacade
  def self.search_results(search, limit)
    if search == 'Top Rated'
      self.top_rated(limit)
    elsif search && search != ''
      self.search(search, limit)
    end
  end

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
