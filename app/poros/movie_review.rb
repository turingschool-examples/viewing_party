class MovieReview
  attr_reader :name,
              :review
  
  def initialize(review_hash)
    @name = review_hash[:author]
    @review = review_hash[:content]
  end

end