require 'date'

class Dashboard::ViewingPartiesController < Dashboard::BaseController
  def new
    title = params[:title]
    runtime = params[:runtime]
    @movie_details = ViewPartyMovie.new(title, runtime)
  end

  def create
    date = params['date']
    title = params['title']
    runtime = params['runtime']
    friends = User.where(id: params[:user][:friends])

    @party = ViewParty.new({ date: date, title: title, runtime: runtime })
  end
end
