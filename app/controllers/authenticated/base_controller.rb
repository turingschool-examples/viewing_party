class Authenticated::BaseController < ApplicationController
  before_action :authenticate

  def authenticate
      redirect_to '/' if !current_user
  end

  def friends_list
    Friend.where('friender_id = ?', current_user.id).map do |friend|
      friend.friendee
    end
  end

end
