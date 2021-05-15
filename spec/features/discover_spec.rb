require 'rails_helper'

RSpec.describe "discover page" do
  before :each do
    @user = User.create!(email: "fav@email.com", username: "bestuser", password: "veryhardpassword")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit discover_path
  end

  xit "should include button to discover top 40 movies" do
    click_button("Find Top 20 Rated Movies")

    expect(current_path).to eq("/movies")
  end

  xit "should allow user to search by movie title" do
    fill_in "Search by movie title", with: "Just Mercy"

    click_button("Find Movies")

    expect(current_path).to eq("/movies?q=just+mercy")
  end
end
