class PartiesController < ApplicationController
  before_action :current_user
  def new
    @movie = Movie.find_or_create_by(name: params[:title], duration: params[:duration])
    @party = Party.new(movie_id: @movie.id, host_id: current_user.id, duration: @movie.duration )
  end

  def create
    @party = Party.create(party_params)
    if @party.save
      invite_friends
      flash[:notice] = 'Invites Sent'
      redirect_to dashboard_path
    else
      flash.now[:error] = 'Invites not sent ,missing Fields'
      render :new, obj: @party
    end
  end

  private

  def party_params
    params.require(:party).permit(:duration, :date, :start_time, :movie_id, :host_id)
  end

  def invite_friends
    params[:party][:friend_check].each do |friend|
      PartyFriend.create(party_id: @party.id,user_id: friend)
    end
  end
end
