class MovieServices < ApiService
  def top_forty
    endpoint1 = "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV["movies_api_key"]}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&vote_count.gte=500&with_watch_monetization_types=flatrate"
    page1 = get_data(endpoint1)
    endpoint2 =endpoint1 = "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV["movies_api_key"]}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=2&vote_count.gte=500&with_watch_monetization_types=flatrate"
    page2 = get_data(endpoint2)
    result = page1[:results].concat(page2[:results])
  end

  def search(keywords, page)
    response = get_data('https://api.themoviedb.org/3/search/movie').get do |f|
      f.params['api_key'] = ENV['movies_api_key']
      f.params['query'] = keywords
      f.params['include_adult'] = false
      f.params['page'] = page
    end
    json = get_json(response)
    json[:results]
  end
end
