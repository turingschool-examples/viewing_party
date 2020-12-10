class ViewingPartyController < ApplicationController
  def new
    @viewing_party = Viewing.new
  end

  def create
    if guest_params.values.all?('0') ||
       params[:viewing][:duration_of_movie].to_i > params[:viewing][:duration_of_party].to_i
      error_return
      render :new
    else
      @movie = Movie.create(movie_params) unless Movie.find_by(api_id: params[:api_id])
      @viewing = @movie.viewings.create(viewing_params)
      @viewing.add_guests(current_user, guest_params)
      mailing_inviter_helper(@viewing)
      redirect_to user_dashboard_path(current_user.username)
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
    DateTime.new(params[:viewing]['date(1i)'].to_i,
                 params[:viewing]['date(2i)'].to_i, params[:viewing]['date(3i)'].to_i,
                 params[:viewing]['start_time(4i)'].to_i,
                 params[:viewing]['start_time(5i)'].to_i,
                 0,
                 '+24:00')
  end

  def guest_params
    params.require(:viewing).require(:friends)
  end

  def error_return
    if guest_params.values.all?('0')
      flash.now[:errors] = "You don't want to have a viewing party with
                        only yourself do you?"
    elsif params[:viewing][:duration_of_movie].to_i > params[:viewing][:duration_of_party].to_i
      flash.now[:errors] = "Your party is not long enough to see the whole
                        movie! Please change your time to accomidate the full viewing."
    end
  end

  def mailing_inviter_helper(viewing)
    email_info = {}
    email_info[:viewing] = viewing
    email_info[:guests] = []
    viewing.guests.each do |guest|
      user = guest.user
      email_info[:guests] << { user: user, hosting: guest.hosting }
    end
    FriendNotifierMailer.send_invites(email_info).deliver_now
  end
end
