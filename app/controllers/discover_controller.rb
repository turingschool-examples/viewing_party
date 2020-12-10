class DiscoverController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @upcoming_movies = SearchFacade.upcoming_movies
  end
end
