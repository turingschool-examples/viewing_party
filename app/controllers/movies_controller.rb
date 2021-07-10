class MoviesController < ApplicationController
  def discover
    # redirect_to welcome_path if current_user.nil?
    @user = current_user
  end

  def index

  end

  def show

  end

end
