class PartiesController < ApplicationController
  def new
    @user = current_user
    @friends = @user.friends

    @movie = MovieFacade.movie_info_by_id(params[:movie_id])
  end

  def create
    movie = MovieFacade.movie_info_by_id(params[:movie_id])
    if party_params[:duration].to_i >= movie.runtime.to_i
      new_party = Party.create(party_params_date_formatted)
      if new_party.save
        invite_guests(params[:invited], new_party)
        redirect_to dashboard_path
        flash[:success] = 'Party has been created successfully. Have fun!'
      else
        redirect_to new_party_path
        flash[:error] = 'Please make sure all fields are valid'
      end
    else
      redirect_to new_party_path
      flash[:error] = 'Party duration cannot be less than movie runtime.'
    end
  end

  def destroy
    party = Party.find(params[:id])
    party.destroy

    redirect_to dashboard_path
    flash[:success] = "#{party.movie_title} viewing party has been deleted."
  end

  private

  def party_params
    params.permit(:movie_id, :movie_title, :duration, :time, :date)
  end

  def party_params_date_formatted
    party_info = party_params
    party_info[:date] = Date.strptime(party_info[:date].gsub('/', '-'), '%Y-%m-%d') if party_info[:date] != ''
    party_info
  end

  def invite_guests(invitees, party)
    Attendee.create(party: party, user: current_user, status: 0)
    invitees.each do |invitee|
      Attendee.create(party: party, user_id: invitee, status: 1)
    end
  end
end
