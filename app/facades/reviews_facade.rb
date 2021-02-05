class ReviewsFacade
  class << self
    def get_reviews(movie_id)
      # require 'pry'; binding.pry
      create_reviews(ReviewsService.retrieve_review(movie_id))
    end


    private

    def create_reviews(reviews_data)
      # require 'pry'; binding.pry
      reviews_data[:results].map do |review_data|
        # require 'pry'; binding.pry
        Review.new(review_data)
      end
    end

  end
end
