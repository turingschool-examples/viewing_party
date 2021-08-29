class MovieService < ApiService
  def search(keyword)
    page_1 = "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movies_api_key']}&language=en-US&query=#{keyword}&page=1&include_adult=false"
    page_2 = "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movies_api_key']}&language=en-US&query=#{keyword}&page=2&include_adult=false"

    get_data(page_1)[:results] << get_data(page_2)[:results]
  end
end
