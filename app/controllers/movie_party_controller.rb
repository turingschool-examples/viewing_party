class MoviePartyController < ApplicationController

  def new
    @title = params[:title]
  end

  def create
    runtime = params[:runtime] # add run time to the data base
    date_time = DateTime.parse((params[:date]+" "+params[:time]))

    test =  current_user
    # binding.pry
    party = MovieParty.create!({user_id: test.id, movie_title: params[:title], date_time: date_time})
    redirect_to '/dashboard'

  end
end
