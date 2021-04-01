class PartiesController < ApplicationController
  def create
    @movie_info = PartyFacade.movie_information(cookies[:bdseivom_di])
    party = PartyFacade.create_party(@movie_info, cookies[:seivom_di], params, current_user.id)
    if party.save
      PartyFriend.make_multiple_friends(params[:friends], party.id, current_user.id)
      redirect_to dashboard_path
    else
      flash[:error] = 'Date and duration must be selected'
      render :new
    end
  end

  def new
    @movie_info = PartyFacade.movie_information(cookies[:bdseivom_di])
  end

  # private
  #
  # def party_params
  #   params.permit(:movie_id, :movie_title, :duration, :date, :user_id)
  # end
end
