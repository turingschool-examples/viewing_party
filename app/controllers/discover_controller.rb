class DiscoverController < ApplicationController
  def index
    # @search_results = api_movies_search('Lord of the Rings')
  end

  private

  def api_movies_search(keywords)
    json = MovieService.new.search(keywords)
    Search.new.first_40_results(json)
  end
end
