class DiscoverController < ApplicationController
  def discover
    @user = current_user
  end
  def index
    if params[:search].present?
      @user = current_user
      @results = MovieInfo.new(params[:search]).search_results
    end
    binding.pry
  end
end
