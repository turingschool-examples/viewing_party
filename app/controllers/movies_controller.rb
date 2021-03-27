class MoviesController < ApplicationController
  before_action :require_current_user

  def index
    @movies = FilmSearch.new.top_40_films
  end

  def search

  end

  private

  def require_current_user
    render file: '/public/401' unless current_user
  end
end
