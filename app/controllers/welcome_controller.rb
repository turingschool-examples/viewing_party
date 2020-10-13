class WelcomeController < ApplicationController
  def index
    return unless session[:current_user]

    redirect_to '/dashboard'
  end
end
