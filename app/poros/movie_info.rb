class MovieInfo
  attr_reader :title,
              :vote_average,
              :runtime,
              :genres,
              :overview,
              :cast,
              :reviews,
              :id,
              :poster

  def initialize(movie, cast, reviews)
    @title = movie[:title]
    @vote_average = movie[:vote_average]
    @runtime = movie[:runtime]
    @genres = movie[:genres]
    @overview = movie[:overview]
    @cast = cast[:cast]
    @reviews = reviews[:results]
    @id = movie[:id]
    @poster = movie[:poster_path]
  end

  def get_poster
    service = MovieService.new
    image = service.image_request_api("/t/p/w300#{@poster}")
    image.env.url.to_s
  end
end
