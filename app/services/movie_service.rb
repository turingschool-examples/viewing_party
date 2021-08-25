class MovieService < ApiService
  def get_movie(id)
    response = get_data("https://api.themoviedb.org/3/movie/#{id}").get do |f|
      f.params['api_key'] = ENV['movie_key']
    end
    get_json(response)
  end

  def get_popular_movies(page)
    response = get_data("https://api.themoviedb.org/3/movie/popular").get do |f|
      f.params['api_key'] = ENV['movie_key']
      f.params['page'] = page
    end
    json = get_json(response)
    json[:results]
  end

  def movie_search(search)
    response = get_data("https://api.themoviedb.org/3/search/movie").get do |f|
      f.params['api_key'] = ENV['movie_key']
      f.params['query'] = search
      f.params['include_adult'] = false
      f.params['page'] = 1
    end
    json = get_json(response)
    json[:results]
  end
end