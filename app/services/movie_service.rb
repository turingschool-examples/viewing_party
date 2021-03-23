class MovieService
  def get_data(url)
    response = Faraday.get(url)
    data = response.body
    json = JSON.parse(data, symbolize_names: true)
    json
  end

  def all_movies_page_count
    url = 'https://api.themoviedb.org/3/discover/movie?api_key=0ac776d1375798ed11d6d31668dc9946&language=en-US&sort_by=vote_average.desc&include_adult=false&include_video=false&page=1'
    movie_data = get_data(url)
    movie_data[:total_pages].times do |n|
      url = "https://api.themoviedb.org/3/discover/movie?api_key=0ac776d1375798ed11d6d31668dc9946&language=en-US&sort_by=vote_average.desc&include_adult=false&include_video=false&page=#{n + 1}"
      movie_data = get_data(url)
      movie_data[:results].each do |movie|
        # require "pry"; binding.pry
        # Movie.create(movie[:id])
      end
    end
  end
end
