class PartiesController < ApplicationController
  before_action :find_user, only: [:new, :create, :destroy]

  def new
    @party = Party.new
  end

  def create
    party = @user.parties.new(party_params)
    if discount.save
      flash[:notice] = "Party has been created!"
      redirect_to dashboard_path(@user)
    else
      flash[:notice] = "Party was not saved. Try again."
      redirect_to new_party_path(@user)
    end
  end

  private
  def party_params
    params.require(:party).permit(:movie_title, :party_duration, :party_date, :start_time, :host_id)
  end

  def find_user
    @user = User.find(params[:host_id]) #user_id ?
  end
end
