class MovieDbFacade
  def self.discover_films(page)
    json = MovieDbService.call_top_films(page)
    @films = create_films(json)
  end

  def self.search_films(query)
    json = MovieDbService.call_search_films(query)
    @films = create_films(json)
  end
  
  private

  def self.create_films(json)
    json[:results].map do |film_data|
      Film.new(film_data)
    end
  end
end
