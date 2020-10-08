class MoviesController < ApplicationController

  # def index
  #   keywords = params[:keywords]
  #
  #   conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
  #     faraday.headers["X-API-Key"] = '11f680bee00017d74632f717b78d12aa'
  #   end
  #
  #   response = conn.get("/3/search/movie?api_key=11f680bee00017d74632f717b78d12aa&query=#{keywords}")
  #
  #   json = JSON.parse(response.body, symbolize_names: true)
  #
  # end
  def index
    keywords = params[:keywords]
       conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
         faraday.headers["X-API-Key"] = 'f905331b6149d6abe03629c65fd15007'
       end
       page_1 = conn.get("3/search/movie?api_key=f905331b6149d6abe03629c65fd15007&language=en-US&query=#{keywords}&page=1&include_adult=false&page=1")
       page_2 = conn.get("3/search/movie?api_key=f905331b6149d6abe03629c65fd15007&language=en-US&query=#{keywords}&page=1&include_adult=false&page=2")
       json_1 = JSON.parse(page_1.body, symbolize_names: true)
       json_2 = JSON.parse(page_2.body, symbolize_names: true)
       movies = json_1[:results] + json_2[:results]
       @movie_info = movies.pluck(:title).zip(movies.pluck(:vote_average))
       binding.pry
  end

end
