require 'rails_helper'

RSpec.describe "discover page" do
  before :each do
    visit discover_path
  end

  it "should include button to discover top 40 movies" do
    click_button("Find Top Rated Movies")

    expect(current_path).to eq("/movies?q=top%20rated")
  end

  it "should allow user to search by movie title" do
    fill_in "Search by movie title", with: "Just Mercy"

    click_button("Find Movies")

    expect(current_path).to eq("/movies?q=just+mercy")
  end
end
