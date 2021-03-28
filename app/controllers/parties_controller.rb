class PartiesController < ApplicationController

  def create
    movie_service = MovieService.new
    movie = Movie.find_by(api_id: params[:party][:api_id])
    movie_info = movie_service.movie_information(movie.api_id)

    party = Party.create!({
                      movie_id:  movie.id,
                   movie_title:  movie_info[:title],
                      duration:  movie_info[:runtime],
                       user_id:  params[:party][:user_id]
                        })
    if params[:party][:date] == "" || params[:party][:duration] == ""
      flash[:error] = "Date and duration must be selected"
      redirect_to new_party_path(movie_id: movie.id, movie_title:movie_info[:title], user_id:  params[:party][:user_id])
    else
      update_party = Party.find(party.id)
      party = update_party.update({date:  params[:party][:date],
                        duration:  params[:party][:duration]
                          })

      redirect_to dashboard_path
    end
  end

  def new
    if params[:movie_id] != nil
      @movie = Movie.find(params[:movie_id])
    else
      @movie = Movie.find_by(api_id: params[:api_id])
    end
    movie_service = MovieService.new
    @movie_info = movie_service.movie_information(@movie.api_id)
    @party = Party.new({
              movie_id:   @movie.id,
              movie_title: params[:movie_title],
              duration:  @movie_info[:runtime],
               user_id:   params[:user_id]})
  end
end
