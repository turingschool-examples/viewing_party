class SessionsController < ApplicationController
  def create
    redirect_to "/dashboard"
  end
end
