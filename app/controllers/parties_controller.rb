class PartiesController < ApplicationController

  def create
    @movie_info = PartyFacade.movie_information(cookies[:bdseivom_di])
    party = Party.new({
                      movie_id:  cookies[:seivom_di],
                   movie_title:  @movie_info.title,
                      duration:  params[:duration],
                      date:  params[:date],
                       user_id:  current_user.id
                        })
    if party.save
      redirect_to dashboard_path
    else
      flash[:error] = "Date and duration must be selected"
      render :new
    end
  end

  def new
    @movie_info = PartyFacade.movie_information(cookies[:bdseivom_di])
  end
end
