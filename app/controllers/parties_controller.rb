class PartiesController < ApplicationController
  def new
    @movie_title = params['title']
    @movie_runtime = params['duration']
  end

  def create
    redirect_to dashboard_path
  end
end
