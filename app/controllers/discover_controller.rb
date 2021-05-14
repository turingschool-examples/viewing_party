class DiscoverController < ApplicationController
  def discover
    binding.pry
    @user = current_user
  end
end
