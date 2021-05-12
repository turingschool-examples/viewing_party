class UsersController < ApplicationController
  def new
    @user = User.new
  end

  # private
  #
  # def _params
  #   params.permit(:)
  # end
end
