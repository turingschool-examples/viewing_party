class DiscoverController < ApplicationController
  def index
    return unless current_user.nil?

    flash[:notice] = 'Discover Page Only Accessible by Authenticated Users. Please Log In.'
    redirect_to root_path
  end
end
