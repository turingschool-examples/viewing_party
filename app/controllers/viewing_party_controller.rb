class ViewingPartyController < ApplicationController
  def new
    @viewing_party = Viewing.new
  end

  def create
    @movie = Movie.create(movie_params)
    binding.pry
  end

  private

  def movie_params
    params.require(:viewing).permit(:title, :api_id, :duration_of_movie)
  end

  def viewing_params
    # params.require(:viewing).permit(:duration_of_party, date, :start_time)
  end

  # def string_from_date_select_params(params, key) 
  #
  #   date_parts = params.select do |k,v|
  #     k.to_s =~ /\A#{key}\([1-6]{1}i\)/
  #   end.values 
  #   binding.pry
  #   date_parts[0..2].join('-') + ' ' + date_parts[3..-1].join(':') 
  # end

  # def date_params
  #   Date.new(params['date(2i)'], params['date(3i)'], params['date(li)'])
  # end
end
