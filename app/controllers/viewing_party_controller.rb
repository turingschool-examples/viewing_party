class ViewingPartyController < ApplicationController
  def new
    @viewing_party = Viewing.new
  end

  def create
    @movie = Movie.create(movie_params)
    @viewing = @movie.viewings.create(viewing_params)
    redirect_to user_dashboard_path(current_user.username)
    @viewing.guests.create(user_id: current_user.id, hosting: true)
    guest_params.each do |id, invite|
      @viewing.guests.create(user_id: id, hosting: false) if invite == '1'
    end
  end

  private

  def movie_params
    params.require(:viewing).permit(:title, :api_id, :duration_of_movie)
  end

  def viewing_params
    viewing = params.require(:viewing).permit(:duration_of_party)
    viewing[:start_time] = date_params
    viewing
  end

  def date_params
    DateTime.new(params[:viewing]['date(1i)'].to_i, params[:viewing]['date(2i)'].to_i, params[:viewing]['date(3i)'].to_i, params[:viewing]['start_time(4i)'].to_i, params[:viewing]['start_time(5i)'].to_i, 0, '+24:00')
  end

  def guest_params
    params.require(:viewing).require(:friends)
  end
end
