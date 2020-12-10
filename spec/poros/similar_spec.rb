require "rails_helper"

RSpec.describe Similar do
  it "exists" do
    attributes = {
      original_title: "The Godfather",
      release_date: "1972-04-21"
    }

    similar = Similar.new(attributes)

    expect(similar).to be_a Similar
    expect(similar.title).to eq("The Godfather")
    expect(similar.release_date).to eq("1972-04-21")

  end
end
