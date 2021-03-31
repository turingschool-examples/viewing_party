class ViewingEventsController < ApplicationController
  def new
    @movie = Movie.find_by(movie_db_id: session[:movie_info]["movie_db_id"])
    if @movie.nil?
      @movie = Movie.create!(session[:movie_info])
    else
      @movie
    end
  end

  def create
    viewing_event = ViewingEvent.new(viewing_event_params)
    if viewing_event.save && params[:friends]
      params[:friends].each do |friend|
        Viewer.new(user_id: friend, viewing_event_id: viewing_event.id)
      end
      redirect_to dashboard_index_path
    else
      flash.now[:errors] = viewing_event.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def viewing_event_params
    params.permit(:duration, :start_date, :start_time, :user_id, :movie_id)
  end
end
