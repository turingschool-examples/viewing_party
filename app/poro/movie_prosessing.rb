class MovieProsessing

  def initialize
    @service = TmdbService.new
  end

  def top_rated_movies
    @results = []
    page_num = 1
    until @results.count >= 40
      @results += @service.top_rated(page_num)[:results]
      page_num += 1
    end
    clean(@results).first(40)
  end

  def search(keywords)
    keywords = keywords.gsub(/ /, '%20')
    @results = clean(@service.search(keywords)[:results])
  end

  def movie_info(api_movie_id)
    details = @service.details(api_movie_id)
    cast = @service.cast(api_movie_id)
    reviews = @service.reviews(api_movie_id)

    info = {
              id: details[:id],
              title: details[:title],
              genres: details[:genres],
              runtime_hours: details[:runtime] / 60,
              runtime_mins: details[:runtime] % 60,
              vote_average: details[:vote_average],
              overview: details[:overview],
              cast: cast_info(cast)[0..9],
              reviews: review_info(reviews)
            }
  end

  def cast_info(info)
    info[:cast].map do |cast_member|
      {name: cast_member[:name], character: cast_member[:character]}
    end
  end

  def review_info(info)
    info[:results].map do |review|
      {author: review[:author], content: review[:content]}
    end
  end

  def clean(info)
    info.reduce({}) do |hash, movie|
      hash[movie[:id]] = {title: movie[:title], vote_average: movie[:vote_average]}
      hash
    end
  end
end
