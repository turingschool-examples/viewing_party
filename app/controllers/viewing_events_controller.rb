class ViewingEventsController < ApplicationController
  def new
    @movie = Movie.find_or_create(session[:movie_info])
  end

  def create
    viewing_event = ViewingEvent.new(viewing_event_params)
    if viewing_event.save && params[:friends]
      Viewer.create_event_viewers(params[:friends], viewing_event.id)
    elsif viewing_event.save
    else
      flash.now[:errors] = viewing_event.errors.full_messages.to_sentence
      render :new
    end
    session.delete(:movie_info)
    redirect_to dashboard_index_path
  end

  private

  def viewing_event_params
    params.permit(:duration, :start_date, :start_time, :user_id, :movie_id)
  end
end
