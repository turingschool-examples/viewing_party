class Authenticated::BaseController < ApplicationController
    before_action :require_login

    private
    def require_login
      if !current_user
        redirect_to welcome_path
        flash[:error] = "Please login"
      end
    end
end
