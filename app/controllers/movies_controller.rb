class MoviesController < ApplicationController

  def index
    keywords = params[:keywords]

    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["X-API-Key"] = 'f905331b6149d6abe03629c65fd15007'
    end
    binding.pry
    response = conn.get("/3/movie/top_rated?api_key=f905331b6149d6abe03629c65fd15007&language=en-US")

    json = JSON.parse(response.body, symbolize_names: true)
    @members = json[:results]
  end


end
