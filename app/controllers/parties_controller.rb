class PartiesController < ApplicationController
  def new
    @party = Party.new
    @movie = MovieService.movie_details(params[:movie_id])
  end

  def create
    party = Party.create(party_params)
    guests_id = params.select { |k| k.include?("invited") }.values
    guest_list = GuestList.make_guest_list(guests_id, party.id)
    if party.save
      redirect_to dashboard_path
    else
      flash[:error] = "Input the correct information"
      redirect_to new_party_path
    end
  end

  private
  def party_params
    params[:party].permit(:duration, :date, :time, :movie_id, :user_id)
  end
end