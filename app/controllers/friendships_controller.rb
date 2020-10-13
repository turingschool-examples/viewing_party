class FriendshipsController < ApplicationController
  def new
    user = User.find(session[:current_user])
    new_friend = User.find_by({ email: params['friend']['email'] })
    verify_friend(new_friend, user)
    redirect_to '/dashboard'
  end

  def verify_friend(new_friend, user)
    if user.friends.include?(new_friend)
      flash[:fail] = "You've already added #{new_friend.email} as a friend!"
    elsif user == new_friend
      flash[:fail] = "Friend can't be yourself!"
    elsif new_friend.nil?
      flash[:fail] = "Can't find user with that email!"
    else
      user.add_friend(new_friend)
    end
  end
end
