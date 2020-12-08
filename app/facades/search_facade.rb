class SearchFacade
  def self.results(title)
    movies = SearchService.search_results(title)
    @search = movies[:results].map do |search_data|
      Search.new(search_data)
    end
  end
end
