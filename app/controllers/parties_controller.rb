class PartiesController < ApplicationController

  def new; end

  def create
    party = current_user.parties.create({
                                          movie_title: params[:movie_title],
                                          date: params[:party_date],
                                          time: params[:start_time]
                                        })

    params[:invitees].each do |user_id|
      party.party_users.create(party_id: party.id, user_id: user_id)
    end
    redirect_to '/user/dashboard'
  end
end
