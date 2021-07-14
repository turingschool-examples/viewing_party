class MoviePartyController < ApplicationController

  def new
    @title = params[:title]
    @movie_length = params[:runtime]

    @hoast = current_user
    # @friendships = Friend.where('friender_id = ?', @hoast.id)
    @friends = Friend.where('friender_id = ?', current_user.id)
  end

  def create
    hoast = current_user
    date_time = DateTime.parse(params[:date]+" "+params[:time])
    party = MovieParty.create({user_id: hoast.id, movie_title: params[:title], date_time: date_time, runtime: params[:duration]})
    #psudo codeing
    # for_each_friend_that_is_checked.each do |id_of_friendship|
    #   Attendee.create(user: id_of_friendship, movie_party: the_party_id)
    # end


    redirect_to '/dashboard'
  end
end
