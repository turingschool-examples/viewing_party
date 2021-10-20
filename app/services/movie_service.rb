class MovieService
  def request_api(path)
    response = conn('http://api.themoviedb.org').get(path)
    parse_json(response)
  end

  # def image_request_api(path)
  #   conn_2('https://image.tmdb.org').get(path)
  # end

  private

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn(url)
    Faraday.new(url: url, params: { api_key: Pusher.key })
  end

  # def conn_2(url)
  #   Faraday.new(url: url)
  # end
end
