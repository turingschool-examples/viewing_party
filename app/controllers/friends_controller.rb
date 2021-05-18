
class FriendsController < ApplicationController

  def create
    friend = User.find_by(email: params[:friend])

    if friend

      if friend.id == current_user.id
        redirect_to dashboards_path
        flash[:error] = 'You cant be friends with yourself!'
      else
        new_friend = Friend.new(user: current_user, friend: friend)
        if new_friend.save
          redirect_to dashboards_path
        else
          redirect_to dashboards_path
          flash[:error] = "You are already friends with #{friend.name}. What!? you forgot already!!!"
        end
      end
    else

      redirect_to dashboards_path
      flash[:error] = 'This user does not exist.'

    end
  end

end
