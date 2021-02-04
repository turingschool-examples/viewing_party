class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def require_user_logged_in!
    redirect_to new_user_path, alert: "You must be signed in to do that." if Current.user.nil?
  end

end
