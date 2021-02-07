class MovieDbFacade
  class << self
    def discover_films
      json = MovieDbService.call_top_films
      create_films(json)
    end

    def search_films(query)
      json = MovieDbService.call_search_films(query)
      create_films(json)
    end
 
    def get_movie_info(mdb_id)
      json = MovieDbService.call_movie_info(mdb_id)
      @film = Film.new(json)
    end

  # rubocop:  private is 'useles' ... does not make singleton methods private. 
  # Use private_class_method or private inside a class << self block instead.
  private

    def create_films(json)
      json[:results].map do |film_data|
        Film.new(film_data)
      end
    end
  end
end
