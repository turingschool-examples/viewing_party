class PartiesController < ApplicationController
	before_action :require_user_logged_in!
	before_action :find_movie

	def new
		@party = Current.user.parties.new
	end

	def create
		party = Current.user.parties.create(name: params[:party][:name],
		                                    datetime: params[:party][:datetime],
		                                    movie_id: @movie.id)

		params[:party][:party_guests].each do |id|
			party.party_guests.create(user_id: id, party_id: party.id)
		end

		redirect_to dashboard_path
	end

	private

	def find_movie
		@movie = Movie.find_by(api_id: session[:movie_api_id])
	end

end