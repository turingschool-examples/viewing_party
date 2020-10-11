class MoviePartyController < ApplicationController
  def new
    @movie = Movie.new.get_specific_movie(params[:id].to_i)
    @duration = Movie.new.calculate_time(@movie)
  end
  # date is in form of day, month, year
  # friends_ids comes in as string
  # 'host' is user_id inside movie_party
  def create
    hour = params[:duration][0].to_i * 60
    minute = params[:duration][-10..-9].to_i
    movie_party = MovieParty.new(user_id: current_user[:id], movie_title: movie_params[:movie], duration: hour + minute, date: params[:date].values.join("/"), start_time: params[:start_time].values.join(":"))
    friends_ids = params[:friend].keys.map{ |id| id.to_i}
    friends = User.where(id: friends_ids)
    if movie_party.save
      friends_ids.each do |number|
        # require "pry"; binding.pry
        movie_party.party_users.create!({ movie_party_id: movie_party.id, user_id: number})
      end
      redirect_to('/dashboard')
    else
      render :new
    end
  end

  private
  def movie_params
    params.permit(:movie)
  end
end
