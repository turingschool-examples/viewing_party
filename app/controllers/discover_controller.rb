class DiscoverController < ApplicationController
  def discover
    @user = current_user
  end

  def index
    if params[:search].present?
      @user = current_user
      @results = MovieInfo.new(params[:search]).search_results
    elsif params[:top_40].present?
      @user = current_user
      @popular_movies = MovieInfo.new(params).popular_movies

    end
  end
end
