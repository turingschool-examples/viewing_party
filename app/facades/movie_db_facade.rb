class MovieDbFacade
  def self.discover_films
    json = MovieDbService.call_top_40_films
    @films = json[:results].map do |film_data|
      Film.new(film_data)
    end
  end
end
