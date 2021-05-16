class PartiesController < ApplicationController
  def new
    @movie_title = params[:movie_title]
    @user_id = current_user.id
  end

  def create
    @user = current_user
    party = current_user.parties.new(party_params)
    if party.save
      flash[:notice] = 'Party has been created!'
      redirect_to dashboard_path
    else

      @movie_title = params[:movie_title]
      @user_id = current_user.id
      flash[:notice] = 'Party was not saved. Try again.'
      render 'new'
    end
  end

  private

  def party_params
    params.permit(:movie_title, :party_duration, :party_date, :start_time, :user_id, :runtime)
  end
end
