class PartiesController < ApplicationController
  def new
    @movie_title = params[:movie_title]
    @user = current_user
  end

  def create
    party = Party.new(party_params)
    if party.save
      current_user.parties << party
      params[:friends].each do |friend|
        if friend != ''
          user = User.find(friend.to_i)
          user.parties << party
        end
      end
      flash[:notice] = 'Party has been created!'
      redirect_to dashboard_path
    else
      @movie_title = params[:movie_title]
      @user = current_user
      flash[:error] = 'Party was not saved. Try again.'
      render 'new'
    end
  end

  private

  def party_params
    params.permit(:movie_title, :movie_id, :party_duration, :party_date, :start_time, :user_id, :runtime)
  end
end
