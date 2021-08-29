class MovieServices
  def name
    endpoint = ''
    ApiService.get_data(endpoint)
  end

  def self.top_forty
    endpoint1 = "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV["movie_api_key"]}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&vote_count.gte=500&with_watch_monetization_types=flatrate"
    page1 = ApiServices.get_data(endpoint1)
    endpoint2 =endpoint1 = "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV["movie_api_key"]}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=2&vote_count.gte=500&with_watch_monetization_types=flatrate"
    page2 = ApiServices.get_data(endpoint2)
    result = page1[:results].concat(page2[:results])
  end
end
