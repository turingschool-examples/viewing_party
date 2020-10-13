class PartiesController < ApplicationController
  def new
    if current_user.nil?
      flash[:notice] = 'New Viewing Party Page Only Accessible by Authenticated Users. Please Log In.'
      redirect_to root_path
    else
      @movie_title = params[:movie_title].titleize
      @movie_runtime = params[:movie_runtime]
    end
  end
end
