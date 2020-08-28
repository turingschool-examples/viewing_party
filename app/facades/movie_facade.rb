class MovieFacade
  def movie_result(id)
    movie_details = MoviesService.new.film_info(id)
    cast = MoviesService.new.cast(id)
    Movie.new(movie_details, cast)
  end 

  def movie_reviews(id)
    reviews_info = MoviesService.new.movie_reviews(id)
    reviews_info.map { |review| FilmReview.new(review) }
  end 

  def movies(keyword)
    if keyword.blank?
      movies = MoviesService.new.top40    
    else
      movies = MoviesService.new.search(keyword)
    end
  end 
end 