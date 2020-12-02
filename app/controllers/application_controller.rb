class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def generate_flash(resource)
    flash[:errors] = resource.errors.full_messages.to_sentence
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
