class MovieFacade
  def self.movies_search(keywords)
    json = MovieServices.new.search(keywords, 1) + MovieServices.new.search(keywords, 2)
    json.map do |movie|
      Movie.new(movie)
    end
  end
end
