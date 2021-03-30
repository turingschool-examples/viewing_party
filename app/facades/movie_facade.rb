require 'ostruct'

class MovieFacade

  def self.top_rated(limit)
    info = MovieService.top_rated(limit)
    return info if info[:error]
    info
  end

  def self.search(keywords, limit)
    info = MovieService.search(keywords, limit)
    return info if info[:error]
    info
  end

  # def self.clean(info, limit)
  #   info.map do |movie|
  #     OpenStruct.new({id: movie[:id], title: movie[:title], vote_average: movie[:vote_average], poster_path: movie[:poster_path]})
  #   end.first(limit)
  # end

  def self.movie_info(api_movie_id)
    details = self.make_api_call("movie/#{api_movie_id}?language=en-US")
    cast = self.make_api_call("movie/#{api_movie_id}/credits?language=en-US")
    reviews = self.make_api_call("movie/#{api_movie_id}/reviews?language=en-US&page=1")

    OpenStruct.new({
              id: details[:id],
              title: details[:title],
              genres: details[:genres],
              runtime: details[:runtime],
              runtime_hours: details[:runtime] / 60,
              runtime_mins: details[:runtime] % 60,
              vote_average: details[:vote_average],
              overview: details[:overview],
              cast: self.cast_info(cast).first(10),
              reviews: self.review_info(reviews),
              poster_path: details[:poster_path]
            })
  end

  def self.cast_info(info)
    info[:cast].map do |cast_member|
      {name: cast_member[:name], character: cast_member[:character]}
    end
  end

  def self.review_info(info)
    info[:results].map do |review|
      {author: review[:author], content: review[:content]}
    end
  end

  private

  def self.make_api_call(url)
    response = self.connection.get(url)
    if response.status == 200
      data = response.body
      JSON.parse(data, symbolize_names: true)
    else
      response = Hash.new([])
      response[:error] = true
      response
    end
  end

  def self.connection
    Faraday.new(url: 'https://api.themoviedb.org/3/', params: { api_key: ENV['movie_api_key'] })
  end
end
