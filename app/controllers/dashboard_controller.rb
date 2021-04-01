class DashboardController < ApplicationController
  def index
    party_array = current_user.parties
    @hosting = MovieService.hosted_parties(party_array)
    invited_array =  GuestList.where("user_id = ?", current_user.id)
    
    @invited = MovieService.invited_parties(invited_array)

    # @hosting = find_hosted_parties
    # we need to reach into parties table and find all parties this user is hosting
    # movie title - only thing we will need API call for, we fucked up , should hvae saved title too and just id idiots
    # date of party
    # time of party
    
    # @invited = find_parties_youre_invited_to
    # movie title - only thing we will need API call for, we fucked up , should hvae saved title too and just id idiots
    # date of party
    # time of party
  end
end
