require 'rails_helper'

RSpec.describe Review do
  it "exists" do
    attributes = {author: 'Joe Rogan',
                  content: 'Bro have you tried DMT?'}

    review = Review.new(attributes)

    expect(review).to be_a(Review)
    expect(review.author).to eq(attributes[:author])
    expect(review.content).to eq(attributes[:content])
  end
end
