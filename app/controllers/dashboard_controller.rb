class DashboardController < ApplicationController
      def index
        if !session[:user_id]
          flash[:info] = 'You need to log in to view your dashboard buddy'
          redirect_to login_path
        else
          current_user
        end
      end
end
