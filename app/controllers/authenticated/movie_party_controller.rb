class Authenticated::MoviePartyController < Authenticated::BaseController

  def new
    @title = params[:title]
    @movie_length = params[:runtime]

    @friends = current_user.friend_alias
  end

  def create
    # binding.pry
    date_time = DateTime.parse(params[:date]+" "+params[:time])
    party = MovieParty.create({user_id: current_user.id, movie_title: params[:title], date_time: date_time, runtime: params[:duration]})

    friends_list.each do |friend|
      if params.include?(friend.email)
        Attendee.create({movie_party_id: party.id, user_id: friend.id})
      end
    end
    party.users.distinct
    post '/email'

    redirect_to '/dashboard'
  end
end
