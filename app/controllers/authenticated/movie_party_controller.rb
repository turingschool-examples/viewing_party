class Authenticated::MoviePartyController < Authenticated::BaseController

  def new
    @title = params[:title]
    @movie_length = params[:runtime]

    @friends = current_user.friend_alias
  end

  def create
    if params[:date] != nil && params[:time] != nil
      date_time = DateTime.parse(params[:date]+" "+params[:time])
    else
      date_time = nil
    end

    party = MovieParty.new({user_id: current_user.id, movie_title: params[:title], date_time: date_time, runtime: params[:duration]})
    if party.save
      friends_list.each do |friend|
        if params.include?(friend.email)
          Attendee.create({movie_party_id: party.id, user_id: friend.id})
        end
      end
      redirect_to '/dashboard'
    end
  end
end
