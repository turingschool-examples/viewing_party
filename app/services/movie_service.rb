class MovieService < ApiService
  def get_movie(id)
    response = get_data("https://api.themoviedb.org/3/movie/#{id}").get do |f|
      f.params['api_key'] = ENV['movie_key']
    end
    get_json(response)
  end
end