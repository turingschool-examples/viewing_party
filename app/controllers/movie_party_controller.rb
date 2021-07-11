class MoviePartyController < ApplicationController

  def new
    @title = params[:title]
  end

  def create
    # date_time = params[:date] + params[:time]

    binding.pry
    runtime = params[:runtime] # add run time to the data base
    # parties = MovieParty.new({title: params[:title], date_time: date_time})


  end
end
