class MoviesController < ApplicationController
  def index; end

<<<<<<< HEAD
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

=======
  def search
    @api_key = ENV['MOVIEDB_API_KEY']
    if params[:keywords].nil? || params[:keywords] == ''
      top_40
    else
      keywords
    end
  end

  def keywords
    keywords = params[:keywords]

    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['X-API-Key'] = @api_key
    end

    page1 = conn.get("3/search/movie?api_key=#{@api_key}&language=en-US&query=#{keywords}&page=1&include_adult=false&page=1")
    page2 = conn.get("3/search/movie?api_key=#{@api_key}&language=en-US&query=#{keywords}&page=1&include_adult=false&page=2")

    json1 = JSON.parse(page1.body, symbolize_names: true)
    json2 = JSON.parse(page2.body, symbolize_names: true)

    movies = json1[:results] + json2[:results]

    @movies_info = movies.pluck(:title).zip(movies.pluck(:vote_average))
  end

  def top_40
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['X-API-Key'] = @api_key.to_s
    end

    page1 = conn.get("/3/movie/top_rated?api_key=#{@api_key}&language=en-US&page=1")
    page2 = conn.get("/3/movie/top_rated?api_key=#{@api_key}&language=en-US&page=2")

    json1 = JSON.parse(page1.body, symbolize_names: true)
    json2 = JSON.parse(page2.body, symbolize_names: true)
    movies = json1[:results] + json2[:results]

    @movies_info = movies.pluck(:title).zip(movies.pluck(:vote_average))
  end
>>>>>>> d825e0b6dd6d9a35f53c1d5646646aa576b0ec4d
end
