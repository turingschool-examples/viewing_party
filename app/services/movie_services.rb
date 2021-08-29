class MovieServices < ApiService
  def name
    endpoint = ''
    get_data(endpoint)
  end

  def top_forty
    endpoint1 = "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV["movies_api_key"]}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&vote_count.gte=500&with_watch_monetization_types=flatrate"
    page1 = get_data(endpoint1)
    endpoint2 =endpoint1 = "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV["movies_api_key"]}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=2&vote_count.gte=500&with_watch_monetization_types=flatrate"
    page2 = get_data(endpoint2)
    result = page1[:results].concat(page2[:results])
  end

  def search(keyword)
    page_1 = "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movies_api_key']}&language=en-US&query=#{keyword}&page=1&include_adult=false"
    page_2 = "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movies_api_key']}&language=en-US&query=#{keyword}&page=2&include_adult=false"
    get_data(page_1)[:results] << get_data(page_2)[:results]
  end
end
