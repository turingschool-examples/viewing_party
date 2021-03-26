require './app/services/movie_services'

class FilmSearch
  def top_40_films
    service.films.reduce([]) do |memo, film|
      memo << [film[:id], film[:original_title], film[:vote_average]]
    end
  end

  def service
    MovieService.new
  end
end

new_movie = FilmSearch.new.top_40_films
binding.pry
