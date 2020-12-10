require "rails_helper"

RSpec.describe Review do
  it "exists" do
    attributes = {
      total_results: 1,
      results: [{
        author: "John Author",
        content: "Just watch it"
      }]
    }

    review = Review.new(attributes)

    expect(review).to be_a Review
    expect(review.total_results).to eq(1)
    expect(review.author).to eq("John Author")
    expect(review.content).to eq("Just watch it")
  end

  it "doesn't exist" do
    attributes = {
      total_results: 0,
      results: [{
        author: "John Author"
      }]
    }

    review = Review.new(attributes)

    expect(review).to be_a Review
    expect(review.total_results).to eq(0)
    expect(review.author).to eq("John Author")
    expect(review.content).to eq("Unknown")
  end
end
