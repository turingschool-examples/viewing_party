class HashInfo
  def self.convert(movie, runtime, cast, recommendations, reviews)
    {
      movie: movie,
      runtime: runtime,
      cast: cast,
      recommendations: recommendations,
      reviews: reviews
    }
  end
end
