class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
    end
  end
end
