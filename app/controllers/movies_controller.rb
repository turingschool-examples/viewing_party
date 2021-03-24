class MoviesController < ApplicationController
  def index
    if params[:form] == "top_forty"
      binding.pry
    @user = "User Place Holder"#session[:user_id]
    end
  end 
end
