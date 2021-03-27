class PartiesController < ApplicationController
  # def index
  #   binding.pry
  # end

  # def show
  #   @movie = Movie.create({api_id: params[:api_id]})
  #   @party = Party.create({movie_id: @movie.id,
  #                       user_id:  params[:user_id]})
  #   redirect_to new_party_path
  # end

  def create
    # binding.pry
    @movie = Movie.find_by(api_id: params[:party][:api_id])
    @party = Party.create({
                      movie_id:  @movie.id,
                          date:  params[:party][:date],
                      duration:  params[:party][:duration],
                   movie_title:  params[:party][:movie_title],
                       user_id:  params[:party][:user_id]
                        })

    redirect_to dashboard_path(params[:party][:user_id])
  end

  def new
    @movie = Movie.create({api_id: params[:api_id]})
    # @party = Party.new({
    #           movie_id:   @movie.id,
    #            user_id:   params[:user_id]
    #                   })
    # binding.pry
  end

end
