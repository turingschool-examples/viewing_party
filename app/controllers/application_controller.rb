class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def error_message(errors)
    errors.full_messages.join(', ')
  end
end
