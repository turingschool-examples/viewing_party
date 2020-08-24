require 'date'

class Dashboard::ViewingPartiesController < Dashboard::BaseController
  def new
    title = params[:title]
    runtime = params[:runtime]
    @movie_details = ViewPartyMovie.new(title, runtime)
  end 

  def create
    date = params['date']
    
    binding.pry
  end 
end 