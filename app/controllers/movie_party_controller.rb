class MoviePartyController < ApplicationController
  def new
    @movie = Movie.new.get_specific_movie(params[:id].to_i)
    @duration = Movie.new.calculate_time(@movie)
  end
  # date is in form of day, month, year
  # friends_ids comes in as string
  def create
    hour = params[:duration][0].to_i * 60
    minute = params[:duration][-10..-9].to_i
    params[:friend]
    params[:friend].keys.each do |id|
      movie = current_user.movie_parties.create({ movie_title: params[:movie], duration: hour + minute, date: params[:date].values.join, start_time: params[:start_time].values.join, friend_id: id.to_i})
      movie.save!
    end
    redirect_to('/dashboard')
  end
end
