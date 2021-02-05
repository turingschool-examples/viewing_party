class MoviesController < ApplicationController
  def index
    return redirect_to root_path, notice: 'Only users may see movies!' if !current_user
    if params[:search].present?
      @films = MovieDbFacade.search_films(params[:search])
    else
      @films = MovieDbFacade.discover_films
    end
  end
end
