require 'rails_helper'

RSpec.describe MovieReview do
  describe '#initialize' do
    it 'creates an instance of a movie' do
      movie_review = MovieReview.new({ author: 'tim', content: 'it was very bad' })

      expect(movie_review.class).to eq(MovieReview)
      expect(movie_review.name).to eq('tim')
      expect(movie_review.review).to eq('it was very bad')
    end
  end
end