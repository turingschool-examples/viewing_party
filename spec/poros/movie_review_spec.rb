require 'rails_helper'
describe 'MovieReview' do
  it 'abstracts and encapsulates movie review data that can be read' do
    review_info = {
      "author": "TheDarkKnight31",
      "author_details": {
        "name": "",
        "username": "TheDarkKnight31",
        "avatar_path": nil,
        "rating": 10.0
      }
    }
  review =  MovieReview.new(review_info)
  expect(review.author).to eq "TheDarkKnight31"
  expect(review.rating).to eq 10.0
  end
end