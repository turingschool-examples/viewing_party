class User::DashboardController < ApplicationController
  def show
    cu_id = current_user.id
    @friends = User.where(id: Friendship.where(user_id: cu_id).pluck(:friend_id)).or(User.where(id: Friendship.where(friend_id: cu_id).pluck(:user_id)))
    @parties_hosting = Party.where(user_id: cu_id)
    parties_invited = Party.where(id: PartyUser.where(user_id: cu_id).pluck(:party_id))
    parties_status = PartyUser.where(user_id: cu_id).pluck(:status)
    parties_status_names = determine_status(parties_status)
    @parties_invited_with_status = parties_invited.zip(parties_status_names)
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
