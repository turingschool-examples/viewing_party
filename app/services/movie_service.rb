class MovieService < ApiService
  def search(keyword)
    endpoint = "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movies_api_key']}&language=en-US&query=#{keyword}&page=1&include_adult=false"
    get_data(endpoint)
  end
end
