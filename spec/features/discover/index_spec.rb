require 'rails_helper'

RSpec.describe "As an authenticated user" do
  before :each do
    @host = create(:user, password: 'password')
    login(@host)
    visit discover_index_path
  end

  describe "When I visit the '/discover' path" do
    it "has a button to discover top 40 movies" do
      expect(page).to have_button("Top 40 Movies")
      click_on("Top 40 Movies")
      expect(current_path).to eq(movies_path)
    end

    it "has a text field to enter keyword(s) to search by movie title" do
      expect(page).to have_field(:search)
      fill_in :search, with: "Jack Reacher"
      click_on("Search")
      expect(current_path).to eq(movies_path)
    end
  end
end
