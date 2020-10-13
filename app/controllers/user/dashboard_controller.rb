class User::DashboardController < ApplicationController
  def show
    if current_user.nil?
      flash[:notice] = 'User Dashboard Only Accessible by Authenticated Users. Please Log In.'
      redirect_to root_path
    else
      @friends = User.where(id: Friendship.where(user_id: current_user.id).pluck(:friend_id))
      @parties_hosting = Party.where(user_id: current_user.id)
      parties_invited = Party.where(id: PartyUser.where(user_id: current_user.id).pluck(:party_id))
      parties_status = determine_status(PartyUser.where(user_id: current_user.id).pluck(:status))
      @parties_invited_with_status = parties_invited.zip(parties_status)
    end
  end

  def determine_status(parties_status)
    parties_status.map do |status|
      if status == 2
        'accepted'
      elsif status == 1
        'declined'
      else
        'pending'
      end
    end
  end
end
