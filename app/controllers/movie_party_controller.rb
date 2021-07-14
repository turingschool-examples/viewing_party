class MoviePartyController < ApplicationController

  def new
    @title = params[:title]
    @movie_length = params[:runtime]

    @hoast = current_user
    @friends = @hoast.friend_alias
  end

  def create
    hoast = current_user
    date_time = DateTime.parse(params[:date]+" "+params[:time])
    party = MovieParty.create({user_id: hoast.id, movie_title: params[:title], date_time: date_time, runtime: params[:duration]})


    friends = hoast.friend_alias.map do |friend|
      friend.friendee
    end
    friends.each do |friend|
      if params[friend.email].to_i == 1
        friend = findparams[friend.email]
        atendee = Attendee.create({movie_party_id: party.id, user_id: friend.id})
      end
    end



    # binding.pry

    #psudo codeing
    # for_each_friend_that_is_checked.each do |id_of_friendship|
    #   Attendee.create(user: id_of_friendship, movie_party: the_party_id)
    # end


    redirect_to '/dashboard'
  end
end
