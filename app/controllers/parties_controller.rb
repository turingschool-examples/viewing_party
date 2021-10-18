class PartiesController < ApplicationController
  def new
    @user = current_user
    @friends = @user.friends

    @movie = MovieFacade.movie_info_by_id(params[:movie_id])
  end

  def create
    party = party_params
    movie = MovieFacade.movie_info_by_id(params[:movie_id])

    if party[:duration].to_i >= movie.runtime.to_i
      new_party = Party.create(party)
      if new_party.save

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

  private

  def party_params
    params.permit(:movie_id, :movie_title, :duration, :time, :date)
  end

  def friend_params
    params.require(:friend).permit!
  end
end
