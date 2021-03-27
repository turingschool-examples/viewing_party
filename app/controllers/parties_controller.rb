class PartiesController < ApplicationController

  def create
    movie_service = MovieService.new
    movie = Movie.find_by(api_id: params[:party][:api_id])
    movie_info = movie_service.movie_information(movie.api_id)

    party = Party.new({
                      movie_id:  movie.id,
                          date:  params[:party][:date],
                      duration:  params[:party][:duration],
                   movie_title:  movie_info[:title],
                       user_id:  params[:party][:user_id]
                        })

    party.save
    redirect_to dashboard_path(params[:party][:user_id])
  end

  def new
    @movie = Movie.create({api_id: params[:api_id]})
    movie_service = MovieService.new
    @movie_title = movie_service.movie_information(@movie.api_id)[:title]
    @party = Party.new({
              movie_id:   @movie.id,
              movie_title: params[:movie_title],
              duration: params[:duration],
               user_id:   params[:user_id]
                      })
  end
end
