class SessionsController < ApplicationController
  def create
    user = User.find_by(uid: user_data[:uid])
    if user.nil?
      User.create(user_data)
      session[:user_id] = user_data[:uid]
      redirect_to '/dashboard'
    elsif user.uid == user_data[:uid]
      session[:user_id] = user_data[:uid]
      redirect_to '/dashboard'
    end
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def user_data
    {
      uid: auth_hash['uid'],
      name: auth_hash['info']['name'],
      email: auth_hash['info']['email']
    }
  end
end
