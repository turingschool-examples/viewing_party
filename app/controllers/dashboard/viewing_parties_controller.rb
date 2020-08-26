require 'date'

class Dashboard::ViewingPartiesController < Dashboard::BaseController
  def new
    title = params[:title]
    runtime = params[:runtime]
    @movie_details = ViewPartyMovie.new(title, runtime)
  end

  def create
    date = params['date']
    time = params['start_time']
    title = params['title']
    runtime = params['runtime']
    friends = User.where(id: params[:user][:friends])
    @party = current_user.view_parties.create(date: date, time: time, movie_title: title, runtime: runtime)
    # @party.users << current_user
    friends.each do |friend|
      @party.users << friend
    end
    redirect_to '/dashboard'
  end
end
