class Review
  attr_reader :reviews
  def initialize(review_info)
    @reviews = review_info.inject({}) do |acc, review|
      acc[review[:author]] = review[:content]
      acc
    end
  end
end
