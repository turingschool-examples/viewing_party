class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def welcome; end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  private

  def error_message(errors)
    errors.full_messages.join(', ')
  end
end
