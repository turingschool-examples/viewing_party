require 'date'

class Dashboard::ViewingPartiesController < Dashboard::BaseController
  def new
    title = params[:title]
    runtime = params[:runtime]
    @movie_details = ViewPartyMovie.new(title, runtime)
  end

  def create
    friends = User.where(id: params[:user][:friends])
    @party = current_user.view_parties.create(date: params[:date], time: params[:start_time], movie_title: params[:title], runtime: params[:runtime])
    friends.each do |friend|
      @party.users << friend
    end
    # add happy/sad paths
    redirect_to '/dashboard'
  end
end
