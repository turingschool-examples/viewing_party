class FriendshipsController < ApplicationController
  def create
    user = find_a_user_by_id(current_user.id)
    friend = find_a_user_by_email(params[:email])
    friendship1 = Friendship.new(user: user, friend: friend)
    friendship2 = Friendship.new(user: friend, friend: user)
    flash_messages(friendship1, friendship2, user)
    redirect_to '/dashboard'
  end

  def find_a_user_by_id(id)
    User.find(id)
  end

  def find_a_user_by_email(email)
    User.find_by(email: email)
  end

  def flash_messages(friendship1, friendship2, user)
    if friendship1.user == user && friendship1.friend == user
      add_self_as_friend_flash_error
    elsif friendship1.save && friendship2.save
      add_friend_flash_success
    else
      friend_not_found_flash
    end
  end

  def add_friend_flash_success
    flash[:success] = 'Friend has been added'
  end

  def add_self_as_friend_flash_error
    flash[:notice] = 'Sorry, you cannot add yourself as a friend'
  end

  def friend_not_found_flash
    flash[:notice] = 'Sorry, friend cannot be found'
  end
end
