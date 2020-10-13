class PartiesController < ApplicationController
  def new
    @movie = MovieFacade.movie_details_for_party(session[:movie_id])
    @user = User.find(current_user)
  end

  def create
    @party = Party.new(party_params)
    if @party.save
      params['party']['invited_ids'][1..-1].each do |id|
        Guest.create(party_id: @party.id, user_id: id, status: "Undecided")
      end
      redirect_to '/dashboard'
    else
      flash[:error] = @party.errors.full_messages.to_sentence
      redirect_to "/parties/new"
    end
  end

  def update
    guest = Guest.find(params['guest'])
    if params['invite'] == 'accepted'
      guest.rsvp_yes
    else
      guest.rsvp_no
    end
    redirect_to '/dashboard'
  end

  def show

  end

  private

  def party_params
    params.require(:party).permit(:title, :api_id, :runtime, :datetime_of_party, :user_id)
  end
end
