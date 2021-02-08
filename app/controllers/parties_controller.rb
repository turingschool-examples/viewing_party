class PartiesController < ApplicationController

	def new
		session[:movie] = {title: params[:title],
		                   api_id: params[:api_id],
		                   runtime: params[:runtime]}
		@movie = session[:movie]
		@party = Current.user.parties.new
	end

	def create
		movie = Movie.create(title: session[:movie]["title"], api_id: session[:movie]["api_id"])
		party = Current.user.parties.create(datetime: params[:party][:datetime], movie_id: movie.id)
		params[:party][:party_guests].each do |id|
			party.party_guests.create(user_id: id, party_id: party.id)
		end
		redirect_to dashboard_path
	end

end