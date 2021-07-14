class Authenticated::PartiesController < Authenticated::BaseController
  def new 
    @movie = MovieFacade.movie_details_by_id(params[:movie_id])
    @friends = current_user.friends
  end 

  def create 
    party = party_params
    movie = MovieFacade.movie_details_by_id(params[:movie_id])
    party[:host_id] = current_user.id 
    
    if party[:duration].to_i > movie.runtime
      new_party = Party.create(party)
      if new_party.save
        redirect_to dashboard_path
        flash[:success] = "You've created a Viewing Party!"
      else 
        redirect_to parties_new_path 
        flash[:error] = "You must enter a valid start time, date and duration."
      end 
    else 
      redirect_to parties_new_path 
      flash[:error] = "Party duration cannot be less than movie run time."
    end
  end

  private 
    def party_params
      params.permit(:movie_id, :duration, :start_time, :date)
    end
end