class ViewingPartiesController < ApplicationController
  def new
    if current_user
      @party = Party.new
      @movie_info = MoviesFacade.get_movie_info(params[:id])
    else
      flash[:error] = "You must be logged in to view this content!"
      redirect_to root_path
    end
  end

  def create
    @movie_info = MoviesFacade.get_movie_info(params[:id])
    party = Party.new(party_params(@movie_info[:id],@movie_info[:title],current_user.id))
    if party.save
      flash[:success] = "Successfully created party!"

      current_user.accepted_friends.each do |friend|
        if params[:party]["friend-#{friend.id}".to_sym]
          UserParty.create(party: party, user: friend)
        end
      end

      redirect_to dashboard_path
    else
      flash[:error] = party.errors.full_messages * ",\n"
      @party = party
      render :new
    end
  end

  private

  def party_params(id,title,host)
    params.require(:party).permit(:duration, :scheduled_date, :start_time).merge(movie_id: id, movie_title: title, user_id: host)
  end
end
