class WelcomeController < ApplicationController
  def index
    return unless current_user

    redirect_to dashboard_path
  end
end
