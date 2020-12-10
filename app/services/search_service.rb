class SearchService
  def self.search_results(title)
    suffix = "/3/search/movie?"

    response = conn.get("#{suffix}&language=en-US&query=#{title}&page=1&include_adult=false")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_cast(id)
    suffix = "/3/movie/#{id}"

    response = conn.get("#{suffix}/credits?")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_details(id)
    suffix = "/3/movie/#{id}"

    response = conn.get("#{suffix}?")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_reviews(id)
    suffix = "/3/movie/#{id}"

    response = conn.get("#{suffix}/reviews?")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_similar(id)
    suffix = "/3/movie/#{id}"

    response = conn.get("#{suffix}/similar?")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_upcoming
    suffix = "/3/movie"

    response = conn.get("#{suffix}/upcoming?")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new("https://api.themoviedb.org") do |f|
      f.params[:api_key] = ENV["MOVIE_SEARCH_API_KEY"]
    end
  end
end
