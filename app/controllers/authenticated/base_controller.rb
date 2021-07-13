class Authenticated::BaseController < ApplicationController
  before_action :authenticate

  def authenticate
      redirect_to '/' if !current_user
  end

end
