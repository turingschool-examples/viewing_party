class ReviewsFacade
  class << self
    def get_reviews(movie_id)
      create_reviews(ReviewsService.retrieve_review(movie_id))
    end


    private

    def create_reviews(reviews_data)
      reviews_data[:results].map do |review_data|
        Review.new(review_data)
      end
    end

  end
end
