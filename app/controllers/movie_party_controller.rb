class MoviePartyController < ApplicationController

  def new
    @title = params[:title]
    @movie_length = params[:runtime]

    @friends = current_user.friend_alias
  end

  def create
    date_time = DateTime.parse(params[:date]+" "+params[:time])
    party = MovieParty.create({user_id: current_user.id, movie_title: params[:title], date_time: date_time, runtime: params[:duration]})

    friends = current_user.friend_alias.map do |friend|
      friend.friendee
    end
    friends.each do |friend|
      if params[friend.email].to_i == 1
        atendee = Attendee.create({movie_party_id: party.id, user_id: friend.id})
      end
    end

    redirect_to '/dashboard'
  end
end
