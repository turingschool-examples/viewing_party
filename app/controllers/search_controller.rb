class SearchController < ApplicationController
  def index
    @search = SearchFacade.results(params["Search by movie title"])
  end
end
