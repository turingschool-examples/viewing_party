class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def error_message(errors)
    errors.full_messages.join(', ')
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
end
