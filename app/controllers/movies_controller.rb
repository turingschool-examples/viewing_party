class MoviesController < ApplicationController
  def index
    if params['result'] == 'top_40'
      @movies = MovieServices.top_forty
      binding.pry
    else
      
    end
  end

  def show
  end 
end
