class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      redirect_to new_user_path
      flash[:error] = 'Please login in or register an account.'
    end
  end

  private

  def error_message(errors)
    errors.full_messages.join(', ')
  end

end
