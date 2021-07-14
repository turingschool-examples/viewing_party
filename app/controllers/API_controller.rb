class APIController < ApplicationController
  def search_get_details
    @title = APIFacade.find_movie_title(params[:title])
  end
end
