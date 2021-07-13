class Authenticated::DashboardController < Authenticated::BaseController
  def show
    @user = current_user
    @friend_list = []
    if params[:email].present?
      params[:email] >> @friend_list
    end
    render :show 
  end

end
