require "rails_helper"

RSpec.describe Search do
  it "exists" do
    attributes = {
      original_title: "The Godfather: Part II",
      vote_average: 10,
      id: 240
    }

    search = Search.new(attributes)
    
    expect(search).to be_a Search
    expect(search.title).to eq("The Godfather: Part II")
    expect(search.vote_avg).to eq(10)
    expect(search.search_id).to eq(240)
  end
end
