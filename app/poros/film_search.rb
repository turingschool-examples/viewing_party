require './app/services/movie_services'
require './app/poros/film'

class FilmSearch
  attr_reader :top_40_films

  def initialize
    @movie_service = MovieService.new
    @top_40_films = top_40
  end

  private

  def top_40
    @top_40_films = [1,2].reduce([]) do |memo, page|
      @movie_service.films(page)[:results].each do |movie|
        memo << Film.new(movie)
      end
      memo
    end
  end

  def movie_searched

  end
end
